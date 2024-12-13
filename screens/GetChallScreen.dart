import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'ChallengeScreen.dart'; // ChallengeScreen import

class GetChallScreen extends StatefulWidget {
  @override
  _GetChallScreenState createState() => _GetChallScreenState();
}

class _GetChallScreenState extends State<GetChallScreen> {
  @override
  void initState() {
    super.initState();
    _fetchRandomChallenge();
  }

  // Firebase에서 랜덤 챌린지 문구 가져오기
  Future<void> _fetchRandomChallenge() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('challenges').get();

      await Future.delayed(Duration(seconds: 2)); // 최소 3초 동안 로딩 화면 유지

      if (querySnapshot.docs.isNotEmpty) {
        final randomIndex = Random().nextInt(querySnapshot.docs.length);
        final randomChallenge = querySnapshot.docs[randomIndex].get('text');

        // ChallengeScreen으로 이동하면서 데이터 전달
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeScreen(challengeMessage: randomChallenge),
          ),
        );
      } else {
        // 챌린지가 없을 경우 메시지 표시
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeScreen(challengeMessage: '챌린지가 없습니다.'),
          ),
        );
      }
    } catch (e) {
      await Future.delayed(Duration(seconds: 2)); // 오류 시에도 최소 3초 로딩 유지
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChallengeScreen(challengeMessage: '오류가 발생했습니다.'),
        ),
      );
      print('Error fetching challenge: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/meagle2.jpg', // 로고 이미지 경로
              height: 300,
              width: 225,
            ),
            Text(
              '챌린지 불러오는 중...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // 로딩 애니메이션
          ],
        ),
      ),
    );
  }
}
