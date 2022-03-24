import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_together/pages/homePage.dart';
import 'package:study_together/pages/immediatelyStudyPage.dart';
import 'package:study_together/pages/regularStudyPage.dart';

class StudyTogether extends StatefulWidget {
  const StudyTogether(
    this.startIndex, {
    Key? key,
  }) : super(key: key);
  final int startIndex;

  @override
  State<StudyTogether> createState() => _StudyTogetherState(startIndex);
}

class _StudyTogetherState extends State<StudyTogether> {
  int currentIndex = 0;

  _StudyTogetherState(int startIndex) {
    currentIndex = startIndex;
  }

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home Page!"),
      //   actions: [
      //     // 삭제 버튼
      //     IconButton(
      //       onPressed: () {
      //         // SharedPreferences에 저장된 모든 데이터 삭제
      //         // prefs.clear();
      //       },
      //       icon: Icon(Icons.delete),
      //     )
      //   ],
      // ),
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: const [
          HomePage(),
          RegularStudyPage(),
          ImmediatelyStudyPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.blueGrey, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (newIndex) {
              print("selected newIndex : $newIndex");
              setState(() {
                currentIndex = newIndex;
              });
            },
            backgroundColor: Colors.grey,
            selectedItemColor: Color.fromARGB(255, 233, 11, 115), // 선택된 아이콘 색상
            unselectedItemColor: Colors.grey[200], // 선택되지 않은 아이콘 색상
            showSelectedLabels: true, // 선택된 항목 label 숨기기
            showUnselectedLabels: true, // 선택되지 않은 항목 label 숨기기
            type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "홈",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_3),
                label: "정규 스터디",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.timer),
                label: "즉시 스터디",
              ),
              // BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
