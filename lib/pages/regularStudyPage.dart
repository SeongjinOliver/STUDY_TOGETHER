import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegularStudyPage extends StatelessWidget {
  const RegularStudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text("여기에 정규 스터디 게시글 리스트를 표현해주세요."),
          ),
          Positioned(
            bottom: 18,
            right: 24,
            child: GestureDetector(
              onTap: () => print("글쓰기"),
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
