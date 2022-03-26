import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:study_together/pages/detailPage.dart';
import 'package:study_together/pages/immediatelyStudyPage.dart';
import 'package:study_together/pages/makeRoomPage.dart';
import 'package:study_together/pages/regularStudyPage.dart';
import 'package:study_together/config/studyTogetherColors.dart';
import 'package:study_together/service/studyService.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          homePage(),
          ImmediatelyStudyPage(),
          RegularStudyPage(),
        ],
      ),
    );
  }
}

/// 첫 번째 페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? onoff;
  List<String> onoffs = [
    '온라인',
    '서울',
    '경기',
    '대전',
    '부산',
    '제주',
  ];

  String? time;
  List<String> times = [
    '새벽 2~7시',
    '아침 7~12시',
    '점심 12~2시',
    '오후 2~6시',
    '저녁 6~10시',
    '밤 10시~2시',
  ];

  String? day;
  List<String> days = [
    '월요일',
    '화요일',
    '수요일',
    '목요일',
    '금요일',
    '토요일',
    '일요일',
  ];

  String? field;
  List<String> fields = [
    '분야 무관',
    'IT/개발',
    '경제/투자',
    '수능',
    '디자인',
    '외국어',
    '자격증',
    '창업',
  ];

  /// 공부 방 분야별 이미지
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
      "imgUrl":
          "https://user-images.githubusercontent.com/101466300/159114243-7e9ed8c8-e932-4237-a28d-cd7e2f27dbb5.png",
    },
    {
      "name": "수능/공부",
      "imgUrl": "https://i.ibb.co/RjXFGcj/laptop-g93ba736f2-1920.jpg",
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
    final StudyService studyService = context.read<StudyService>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
                pinned: true, // 스크롤시 bottom 영역을 화면 상단에 남길지 여부
                snap: false, // 중간에 멈출 때 자동으로 AppBar를 펼쳐서 배경을 모두 보여줄지
                floating: true, // AppBar를 화면에 띄울지, 아니면 컬럼처럼 최 상단에 놓을지
                expandedHeight: 170, // 최대 확장되었을 떄 높이
                backgroundColor: Colors.white,

                /// 스크롤시 사라지는 영역
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      /// 백그라운드 이미지
                      Positioned.fill(
                          bottom: 50,
                          child: Image.asset(
                            'assets/Logo-removebg-preview.png',
                            fit: BoxFit.fitHeight,
                          )),

                      /// 배경 위 위젯
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// Tip: LinearProgressIndicator가 끝없이 길어지지 않도록 Column의 가로 길이를 Row의 남은 자리만큼만 차지하도록 만들어줌
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "공부레벨2까지 9시간만 더!★",
                                        style: TextStyle(
                                          color: StudyTogetherColors.color4,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          value: 0.083,
                                          minHeight: 10,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            StudyTogetherColors.color4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 14),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    // 공통 스타일
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "1",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: StudyTogetherColors.color2),
                                      ),
                                      TextSpan(
                                        text: " / ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "10 \u{1F3C6}",
                                        style: TextStyle(
                                          color: StudyTogetherColors.color4,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// 스크롤시 남아있는 영역
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    height: 35,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      '온/오프 선택',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: onoffs
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: onoff,
                              onChanged: (value) {
                                setState(() {
                                  onoff = value as String;
                                });
                              },
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 14,
                              iconEnabledColor: Colors.yellow,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 100,
                              buttonPadding:
                                  const EdgeInsets.only(left: 5, right: 5),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: StudyTogetherColors.color1,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.redAccent,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      '시간',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: times
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: time,
                              onChanged: (value) {
                                setState(() {
                                  time = value as String;
                                });
                              },
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 14,
                              iconEnabledColor: Colors.yellow,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 8, right: 5),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: StudyTogetherColors.color1,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.redAccent,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      '요일',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: days
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: day,
                              onChanged: (value) {
                                setState(() {
                                  day = value as String;
                                });
                              },
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 14,
                              iconEnabledColor: Colors.yellow,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 8, right: 5),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: StudyTogetherColors.color1,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.redAccent,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      '분야',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: fields
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: field,
                              onChanged: (value) {
                                setState(() {
                                  field = value as String;
                                });
                              },
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 14,
                              iconEnabledColor: Colors.yellow,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 8, right: 5),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: StudyTogetherColors.color1,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.redAccent,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),

                          /// 텍스트 입력창
                          /// Expanded(
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //      hintText: "세부 분야를 검색해 보세요.",
                          //     ),
                          //  ),
                          // ),

                          //검색버튼
                          //GestureDetector(
                          // onTap: () => print("검색 클릭 됨"),
                          //child: Row(
                          //  children: [
                          //  ElevatedButton.icon(
                          //     onPressed: null,
                          //     label: Text('검색'),
                          //      icon: Icon(Icons.search),
                          //     ),
                          //    ],
                          //    ),
                          //  ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///스터디 목록 미리보기
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 정규 스터디 Title
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // 공통 스타일
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "정규",
                              style: TextStyle(
                                color: StudyTogetherColors.color4,
                              ),
                            ),
                            TextSpan(text: " 스터디"),
                          ],
                        ),
                      ),
                    ),

                    /// 정규 스터디 목록
                    SizedBox(
                      height: 150,
                      child: FutureBuilder<QuerySnapshot>(
                          future: studyService.read('정규 스터디'),
                          builder: (context, snapshot) {
                            final documents = snapshot.data?.docs ?? [];
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                final doc = documents[index];
                                final category =
                                    categoryList[index % categoryList.length];

                                final imgUrl = category["imgUrl"] ?? "";
                                final field = doc.get("field");
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(doc, imgUrl!)),
                                      );
                                      //launch(roompage);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 52,
                                                backgroundImage:
                                                    NetworkImage(imgUrl),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                field,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                    SizedBox(height: 10),

                    /// 즉시 스터디 Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // 공통 스타일
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "즉시",
                              style: TextStyle(
                                color: StudyTogetherColors.color4,
                              ),
                            ),
                            TextSpan(text: " 스터디"),
                          ],
                        ),
                      ),
                    ),

                    /// 즉시 스터디 목록
                    SizedBox(
                      height: 150,
                      child: FutureBuilder<QuerySnapshot>(
                          future: studyService.read('즉시 스터디'),
                          builder: (context, snapshot) {
                            final documents = snapshot.data?.docs ?? [];
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                final doc = documents[index];
                                final category =
                                    categoryList[index % categoryList.length];

                                final imgUrl = category["imgUrl"] ?? "";
                                final field = doc.get("field");
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(doc, imgUrl!)),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 52,
                                                backgroundImage:
                                                    NetworkImage(imgUrl),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                field,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                    SizedBox(height: 10),

                    /// 시간대별 스터디 Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // 공통 스타일
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "시간대별",
                              style: TextStyle(
                                color: StudyTogetherColors.color4,
                              ),
                            ),
                            TextSpan(text: " 스터디"),
                          ],
                        ),
                      ),
                    ),

                    /// 시간대별 스터디 목록
                    SizedBox(
                      height: 150,
                      child: FutureBuilder<QuerySnapshot>(
                          future: studyService.read('정규 스터디'),
                          builder: (context, snapshot) {
                            final documents = snapshot.data?.docs ?? [];
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                final doc = documents[index].data()
                                    as Map<String, dynamic>;
                                final category =
                                    categoryList[index % categoryList.length];

                                final imgUrl = category["imgUrl"] ?? "";
                                // final startDate = DateTime.now();
                                final startDateTimestamp =
                                    doc["startDate"] as Timestamp;
                                // print("test" + startDate.toString());
                                // final finishDate = doc["finishDate"];

                                // final formatter = DateFormat.Hm(
                                //         startDateTimestamp.toString()) ??
                                //     "";
                                // print(formatter);
                                // // print(formatter);
                                // print(formatter);
                                final startDate = startDateTimestamp
                                    .toDate()
                                    .toString()
                                    .split(' ');
                                final date =
                                    startDate[0].toString().substring(2, 10);
                                final time =
                                    startDate[1].split('.')[0].substring(0, 5);

                                return SizedBox(
                                  width: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 52,
                                        backgroundImage: NetworkImage(imgUrl),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        '$time',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),

          /// 공부방 만들기 버튼
          Positioned(
            bottom: 20,
            right: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MakeRoomPage()),
                );
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
