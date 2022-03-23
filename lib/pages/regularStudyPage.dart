import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_together/config/studyTogetherColors.dart';
import 'package:study_together/pages/makeRoomPage.dart';

class RegularStudyPage extends StatelessWidget {
  const RegularStudyPage({Key? key}) : super(key: key);

  /// 배경 이미지 URL
  final String LogoImg =
      "https://raw.githubusercontent.com/SeongjinOliver/STUDY_TOGETHER/main/Logo-removebg-preview.png";

  /// 분야별 이미지 URL
  final List<Map<String, String>> categoryList = const [
    {
      "name": "분야 무관",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114541-559cb125-4548-4898-b8eb-b1c4177dc5cb.png",
    },
    {
      "name": "IT/개발",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114221-3b30aaab-2388-4331-b3a0-044ea6a049ad.png",
    },
    {
      "name": "경제/투자",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114243-7e9ed8c8-e932-4237-a28d-cd7e2f27dbb5.png",
    },
    {
      "name": "수능/공부",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114257-88f3c66c-a4b8-4d2d-9451-323a810ff9d4.png",
    },
    {
      "name": "디자인",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114246-06b354b2-ab51-4ef4-8f23-7d89fc0408b0.png",
    },
    {
      "name": "외국어",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114254-54c4d675-9052-4ae7-a06d-0bbb73577440.png",
    },
    {
      "name": "자격증",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114249-5a18ab68-7047-4392-bc9e-8becda73c421.png",
    },
    {
      "name": "창업",
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114239-c982ae3c-6129-4c0f-b757-6c734bf0257f.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          '스터디 찾기',
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
            child: Center(
              child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    final category = categoryList[index % categoryList.length];
                    final name = category["name"] ?? "이름";
                    final imgUrl = category["imgUrl"] ?? "";
                    return ListTile(
                      leading: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('함께 집중해서 스터디할 팀원 구합니다!'),
                          SizedBox(
                            width: 180,
                            child: Row(
                              children: [
                                Text(
                                  '진행중',
                                  style: TextStyle(
                                      color: StudyTogetherColors.color2),
                                ),
                                Spacer(),
                                Text('멤버 5/10'),
                                Spacer(),
                                Text('온라인'),
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
                        //launch(roompage);
                      },
                    );
                  }),
            ),
          ),
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
  }
}
