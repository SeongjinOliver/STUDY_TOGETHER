import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'makeRoomPage.dart';

class ImmediatelyStudyPage extends StatelessWidget {
  const ImmediatelyStudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text("여기에 즉시 스터디 게시글 리스트를 표현해주세요."),
          ),
          Positioned(
            bottom: 18,
            right: 24,
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeRoomPage()),
                ),
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "글쓰기",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
