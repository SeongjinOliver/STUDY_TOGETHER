import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:study_together/config/studyTogetherColors.dart';
import 'package:study_together/pages/studyTogether.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          /// 첫 번째 페이지
          PageViewModel(
            title: "더 이상 혼자 공부하지 마세요 !",
            body: "온/온프라인으로 함께 공부할 수 있는 동료를 찾아보세요",
            image: Padding(
                padding: EdgeInsets.all(1),
                child: Image.asset('assets/Logo-removebg-preview.png',
                    width: double.infinity)),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: StudyTogetherColors.color2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: StudyTogetherColors.color1,
                fontSize: 18,
              ),
            ),
          ),
          // 두 번째 페이지
          PageViewModel(
            title: "시간대와 분야를 선택하면 방목록이 나와요!",
            body: "원하시는 방에 접속한 후, 줌/게더타운 링크를 통해 함께 공부하세요.",
            image: Padding(
                padding: EdgeInsets.all(1),
                child: Image.asset('assets/Logo-removebg-preview.png',
                    width: double.infinity)),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ), // 세 번째 페이지
        ],
        next: Text("다음",
            style: TextStyle(
                color: StudyTogetherColors.color1,
                fontWeight: FontWeight.bold)),
        done: Text("들어가기",
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        onDone: () {
          // Done 클릭시 페이지 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StudyTogether()),
          );
        },
      ),
    );
  }
}
