import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  // 더미 데이터: 순위, 사용자 이름, 횟수
  final List<Map<String, dynamic>> rankings = [
    {'rank': 1, 'name': '멋있는 호랑이', 'count': 158},
    {'rank': 2, 'name': '귀여운 래서판다', 'count': 120},
    {'rank': 3, 'name': '깡총 토끼', 'count': 98},
    {'rank': 4, 'name': '매력쟁이 여우', 'count': 85},
    {'rank': 5, 'name': '코가 예쁜 코뿔소', 'count': 77},
    {'rank': 6, 'name': '손이 예쁜 코끼리', 'count': 65},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOP 100'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // 순위 리스트
          Expanded(
            child: ListView.builder(
              itemCount: rankings.length,
              itemBuilder: (context, index) {
                final rank = rankings[index]['rank'];
                final name = rankings[index]['name'];
                final count = rankings[index]['count'];

                return ListTile(
                  leading: _buildRankIcon(rank),
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    '$count회',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          // 하단 사용자 정보 섹션
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '22153',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '나이름',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '1회',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      // 하단 네비게이션 바

    );
  }

  // 순위 아이콘 위젯
  Widget _buildRankIcon(int rank) {
    switch (rank) {
      case 1:
        return Icon(Icons.emoji_events, color: Colors.yellow[700], size: 32);
      case 2:
        return Icon(Icons.emoji_events, color: Colors.grey, size: 32);
      case 3:
        return Icon(Icons.emoji_events, color: Colors.brown, size: 32);
      default:
        return CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Text(
            '$rank',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        );
    }
  }
}