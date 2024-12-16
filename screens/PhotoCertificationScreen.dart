import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class PhotoCertificationScreen extends StatefulWidget {
  @override
  _PhotoCertificationScreenState createState() => _PhotoCertificationScreenState();
}

class _PhotoCertificationScreenState extends State<PhotoCertificationScreen> {
  File? _imageFile;
  String _recognizedText = '인식된 내용 없음';
  final ImagePicker _picker = ImagePicker();

  // ML Kit 라벨러 로드
  final ImageLabeler _labeler = GoogleMlKit.vision.imageLabeler();

  // 사진 촬영 후 라벨 인식
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // 이미지 라벨링
      await _labelImage(File(pickedFile.path));
    }
  }

  // 이미지를 라벨링하여 분석하기
  Future<void> _labelImage(File image) async {
    final inputImage = InputImage.fromFile(image);
    final labels = await _labeler.processImage(inputImage);

    setState(() {
      if (labels.isNotEmpty) {
        _recognizedText = labels.map((label) => label.label).join(', ');
      } else {
        _recognizedText = '라벨을 인식할 수 없습니다';
      }
    });
  }

  // 인증 성공 다이얼로그
  void _showCertificationSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('인증 성공'),
          content: Text('라벨을 통해 인증되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _labeler.close(); // 리소스 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('사진 인증')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile == null
                ? Text(
              '사진을 찍어주세요.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
                : Image.file(_imageFile!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('사진 촬영'),
            ),
            SizedBox(height: 20),
            Text(
              '인식된 라벨: $_recognizedText',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
