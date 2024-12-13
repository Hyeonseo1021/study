import 'package:flutter/material.dart';

class FailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('챌린지 실패'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 실패 이미지
            Image.asset(
              'assets/Failed.jpg', // 이미지 경로
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            // 실패 메시지
            Text(
              '실패...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
