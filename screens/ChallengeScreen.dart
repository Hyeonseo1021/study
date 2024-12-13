import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  final String challengeMessage;

  const ChallengeScreen({Key? key, required this.challengeMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            Image.asset(
              'assets/images/meagle0.jpg',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8.0),
            const Text(
              'RRC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '챌린지',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                challengeMessage, // 전달받은 챌린지 메시지 표시
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Image.asset(
                'assets/images/meagle2.jpg',
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('인증 완료!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[600],
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text(
                '인증',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar 추가

    );

  }
}
// 각각의 인증 화면 예제
class PhotoVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('사진 인증')),
      body: const Center(child: Text('사진 인증 화면')),
    );
  }
}

class TextVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('텍스트 인증')),
      body: const Center(child: Text('텍스트 인증 화면')),
    );
  }
}

class CheckboxVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('체크박스 인증')),
      body: const Center(child: Text('체크박스 인증 화면')),
    );
  }
}