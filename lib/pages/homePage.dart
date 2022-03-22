import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study_together/pages/immediatelyStudyPage.dart';
import 'package:study_together/pages/makeRoomPage.dart';
import 'package:study_together/pages/regularStudyPage.dart';
import 'package:study_together/config/studyTogetherColors.dart';

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
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                          /// What's New

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "요일",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "시간",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "온/오프라인",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "분야",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// 텍스트 입력창
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "세부 분야를 검색해 보세요.",
                              ),
                            ),
                          ),

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
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 종일 스터디 Title
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
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
                              text: "종일",
                              style: TextStyle(
                                color: StudyTogetherColors.color4,
                              ),
                            ),
                            TextSpan(text: " 스터디"),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 32),

                    /// 종일 스터디 목록
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          final category =
                              categoryList[index % categoryList.length];
                          final name = category["name"] ?? "이름";
                          final imgUrl = category["imgUrl"] ?? "";
                          return SizedBox(
                            width: 120,
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
                                  name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    /// 저녁 스터디 Title
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
                              text: "저녁",
                              style: TextStyle(
                                color: StudyTogetherColors.color4,
                              ),
                            ),
                            TextSpan(text: " 스터디"),
                          ],
                        ),
                      ),
                    ),

                    /// 저녁 스터디 목록
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          final category =
                              categoryList[index % categoryList.length];
                          final name = category["name"] ?? "이름";
                          final imgUrl = category["imgUrl"] ?? "";
                          return SizedBox(
                            width: 120,
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
                                  name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          final category =
                              categoryList[index % categoryList.length];
                          final name = category["name"] ?? "이름";
                          final imgUrl = category["imgUrl"] ?? "";
                          return SizedBox(
                            width: 128,
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
                                  name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
                  color: StudyTogetherColors.color4,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Row(
                  children: [
                    Text(
                      "공부방 만들기",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.meeting_room_sharp,
                      color: Colors.white,
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
