import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // FirebaseAuth 추가
import 'firebase_options.dart';
import 'screens/LoginScreen.dart'; // 로그인 화면
import 'screens/StartScreen.dart'; // 메인 화면
import 'screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Rand Chall',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // 로딩 화면을 첫 화면으로 설정
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Firebase 인증 상태 확인
    Future.delayed(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser; // 현재 로그인된 사용자 확인

      if (user != null) {
        // 사용자가 로그인되어 있으면 StartScreen으로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // 로그인된 사용자가 없으면 LoginScreen으로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartScreen()),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RealRandChall',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/meagle0.jpg', height: 300), // 로고 이미지
            SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 20),
            ),
            CircularProgressIndicator(), // 로딩 애니메이션
          ],
        ),
      ),
    );
  }
}
