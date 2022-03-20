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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
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
              SizedBox(height: 10),
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
              // DropdownMenuItem(child: )
            ],
          ),
        ),
      ),
    );
  }
}
