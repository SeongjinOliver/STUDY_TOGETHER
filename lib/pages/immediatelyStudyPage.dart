import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_together/config/studyTogetherColors.dart';
import 'package:study_together/pages/detailPage.dart';
import 'package:study_together/service/studyService.dart';

import 'detailPage.dart';
import 'makeRoomPage.dart';

class ImmediatelyStudyPage extends StatelessWidget {
  const ImmediatelyStudyPage({Key? key}) : super(key: key);

  /// 배경 이미지 URL
  final String LogoImg =
      "https://raw.githubusercontent.com/SeongjinOliver/STUDY_TOGETHER/main/Logo-removebg-preview.png";

  /// 분야별 이미지 URL
  final List<Map<String, String>> categoryList = const [
    {
      "name": "분야 무관",
      "imgUrl": "https://i.ibb.co/DtL9f5T/library-gcb425fc9b-1920.jpg",
    },
    {
      "name": "IT/개발",
      "imgUrl": "https://i.ibb.co/pvcP9ZK/notebook-g10db0d293-1920.jpg",
    },
    {
      "name": "경제/투자",
      "imgUrl": "https://i.ibb.co/R9L0nqD/Money.jpg",
    },
    {
      "name": "수능/공부",
      "imgUrl": "https://i.ibb.co/XJvkSWY/Gosi.jpg",
    },
    {
      "name": "디자인",
      "imgUrl": "https://i.ibb.co/F0KZ63f/Design.jpg",
    },
    {
      "name": "외국어",
      "imgUrl": "https://i.ibb.co/zPM43vQ/Langue.jpg",
    },
    {
      "name": "자격증",
      "imgUrl": "https://i.ibb.co/h9KKF0M/Certificat.png",
    },
    {
      "name": "창업",
      "imgUrl": "https://i.ibb.co/55M9Gg6/Startup.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, studyService, child) {
      final StudyService studyService = context.read<StudyService>();
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            '즉시 스터디 찾기',
            style: TextStyle(
              color: StudyTogetherColors.color1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<QuerySnapshot>(
                  future: studyService.read('즉시 스터디'),
                  builder: (context, snapshot) {
                    final documents = snapshot.data?.docs ?? [];
                    return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          final doc = documents[index];
                          final category =
                              categoryList[index % categoryList.length];
                          final title = doc.get("title");
                          final description = doc.get("description");
                          final currentMemberCount =
                              doc.get("currentMemberCount");
                          final memberMaxCount = doc.get("memberMaxCount");
                          final onOffLine = doc.get("onOffLine");
                          final field = doc.get("field");

                          String? imgUrl = category["imgUrl"] ?? "";
                          for (Map<String, String> category in categoryList) {
                            if (category['name'] == field) {
                              imgUrl = category['imgUrl'];
                              break;
                            }
                          }
                          final DateTime finishDate =
                              doc.get("finishDate").toDate();
                          final now = DateTime.now();
                          return ListTile(
                            leading: Image.network(
                              imgUrl!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(description),
                                SizedBox(
                                  width: 220,
                                  child: Row(
                                    children: [
                                      Text(
                                        finishDate.compareTo(now) > 0
                                            ? '진행중'
                                            : '종료',
                                        style: TextStyle(
                                            color: StudyTogetherColors.color2),
                                      ),
                                      Spacer(),
                                      Text('최대인원 $memberMaxCount'),
                                      Spacer(),
                                      Text('$onOffLine'),
                                      Spacer(),
                                      Text('$field'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider()
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(doc, imgUrl!)),
                              );
                            },
                          );
                        });
                  }),
            ),
            //방만들기 버튼
            Positioned(
              bottom: 20,
              right: 25,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MakeRoomPage()),
                  ),
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: StudyTogetherColors.color1,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "공부방 만들기",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.meeting_room_sharp,
                        color: Colors.yellow,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
