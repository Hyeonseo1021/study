import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class Textcertificationscreen extends StatefulWidget {
  @override
  _TextCertificationScreenState createState() => _TextCertificationScreenState();
}

class _TextCertificationScreenState extends State<Textcertificationscreen> {
  File? _imageFile;
  String _recognizedText = '인식된 텍스트 없음';
  final ImagePicker _picker = ImagePicker();
  final TextRecognizer _textRecognizer = GoogleMlKit.vision.textRecognizer();

  // 사진 촬영 후 텍스트 인식
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // 이미지에서 텍스트 인식
      await _recognizeText(File(pickedFile.path));
    }
  }

  // ML Kit을 사용한 텍스트 인식
  Future<void> _recognizeText(File image) async {
    final inputImage = InputImage.fromFile(image);
    final recognizedText = await _textRecognizer.processImage(inputImage);

    setState(() {
      _recognizedText = recognizedText.text; // 인식된 텍스트 업데이트
    });

    // 텍스트 인식 결과를 기반으로 자동 인증 처리
    if (_recognizedText.isNotEmpty) {
      _showCertificationSuccessDialog();
    }
  }

  // 인증 성공 다이얼로그
  void _showCertificationSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('인증 성공'),
          content: Text('사진이 정상적으로 인증되었습니다.'),
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
    _textRecognizer.close(); // 리소스 정리
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
              '인식된 텍스트: $_recognizedText',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
