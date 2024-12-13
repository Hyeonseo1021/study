import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RewardApp());
}

class RewardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RewardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RewardScreen extends StatefulWidget {
  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  bool _isSubmitted = false;

  // 예제 사용자 ID (실제 앱에서는 인증된 사용자 ID 사용)
  final String userId = 'user123';

  // Firestore에 데이터 저장 함수
  Future<void> saveEntry() async {
    await FirebaseFirestore.instance.collection('entries').add({
      'userId': userId,
      'reward': 'LG 코드제로 로보킹 AI 올인원',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // 응모 처리 함수
  void handleSubmission() async {
    await saveEntry();
    setState(() {
      _isSubmitted = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isSubmitted = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리워드'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/robot.png', height: 200),
              SizedBox(height: 20),
              Text(
                'LG 코드제로 로보킹 AI 올인원',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSubmitted ? null : handleSubmission,
                child: Text('응모하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
              if (_isSubmitted)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '응모가 완료되었습니다!',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              SizedBox(height: 50), // 추가 여백
            ],
          ),
        ),
      ),
    );
  }
}