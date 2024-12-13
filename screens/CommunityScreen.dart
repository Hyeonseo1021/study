import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  // 더미 데이터: 커뮤니티 게시글
  final List<Map<String, String>> posts = [
    {'category': '공지', 'title': '오늘 챌린지 엄청 쉬움', 'author': '미르', 'date': '2023.05.02'},
    {'category': '꿀팁', 'title': '혼자 시리즈 챌린지 하는 방법', 'author': 'BAN 시온', 'date': '2023.04.26'},
    {'category': '', 'title': '챌린지 성공한 사람 손', 'author': '희', 'date': '2023.04.26'},
    {'category': '', 'title': '빨리 성공하는 방법', 'author': 'HIE', 'date': '2023.04.26'},
    {'category': '', 'title': '가족과 함께 챌린지 성공', 'author': 'ALEX', 'date': '2023.04.26'},
    {'category': '', 'title': '캐릭터 너무 귀엽다', 'author': '미르', 'date': '2023.04.26'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('커뮤니티'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 광고 배너
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '광고 배너',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // 게시글 리스트
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: post['category']!.isNotEmpty
                      ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      post['category']!,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                      : null,
                  title: Text(
                    post['title']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${post['author']} • ${post['date']}'),
                );
              },
            ),
          ),

          // 글쓰기 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ),
        ],
      ),

      // 하단 네비게이션 바

    );
  }
}