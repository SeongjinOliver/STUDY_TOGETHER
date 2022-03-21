import 'package:flutter/material.dart';

import '../config/studyTogetherColors.dart';

class MakeRoomPage extends StatefulWidget {
  const MakeRoomPage({Key? key}) : super(key: key);

  @override
  State<MakeRoomPage> createState() => _MakeRoomPageState();
}

class _MakeRoomPageState extends State<MakeRoomPage> {
  String onOffLineDropdownValue = '온라인';
  String timeDropdownValue = '1';
  String fieldDropdownValue = 'IT';
  String memberCountDropdownValue = '1';
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Study Together",
          style: TextStyle(
            color: StudyTogetherColors.color4,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              // Text(
              //   "제목",
              // ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "제목을 입력하세요",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: StudyTogetherColors.color4),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "온/오프라인",
                  ),
                  SizedBox(width: 10),
                  DropdownButton(
                    value: onOffLineDropdownValue,
                    items: <String>['온라인', '오프라인']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        onOffLineDropdownValue = newValue!;
                      });
                    },
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    underline: Container(
                      height: 2,
                      color: StudyTogetherColors.color4,
                    ),
                    iconSize: 28,
                    iconEnabledColor: StudyTogetherColors.color4,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "시간대",
                  ),
                  SizedBox(width: 40),
                  DropdownButton(
                    value: timeDropdownValue,
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10',
                      '11',
                      '12'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        timeDropdownValue = newValue!;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: StudyTogetherColors.color4,
                    ),
                    iconSize: 28,
                    iconEnabledColor: StudyTogetherColors.color4,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "분야",
                  ),
                  SizedBox(width: 50),
                  DropdownButton(
                    value: fieldDropdownValue,
                    items: <String>['ENGLISH', 'IT']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        fieldDropdownValue = newValue!;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: StudyTogetherColors.color4,
                    ),
                    iconSize: 28,
                    iconEnabledColor: StudyTogetherColors.color4,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "인원수",
                  ),
                  SizedBox(width: 40),
                  DropdownButton(
                    // elevation: 30,
                    value: memberCountDropdownValue,
                    items: <String>['1', '2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        memberCountDropdownValue = newValue!;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: StudyTogetherColors.color4,
                    ),
                    iconSize: 28,
                    iconEnabledColor: StudyTogetherColors.color4,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "설명글",
              ),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                minLines: 6,
                decoration: InputDecoration(
                  // fillColor: Colors.blueAccent,
                  filled: true,
                  hintText: "이 글에 대해서 설명 해주세요",
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "참여 방법",
              ),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                  // fillColor: Colors.blueAccent,
                  filled: true,
                  hintText: "zoom, gather ...등의 url을 남겨주세요",
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    // style: style,
                    onPressed: () {},
                    child: const Text('방 만들기'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    // style: style,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("경고"),
                            content:
                                new Text("현재까지 쓴 글이 삭제 됩니다. 그래도 취소 하시겠습니까?"),
                            actions: [
                              // 취소 버튼
                              TextButton(
                                child: Text(
                                  "취소",
                                  style: TextStyle(
                                    color: StudyTogetherColors.color2,
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              // 작성 버튼
                              TextButton(
                                child: Text(
                                  "확인",
                                  style: TextStyle(
                                    color: StudyTogetherColors.color2,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('취소'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
