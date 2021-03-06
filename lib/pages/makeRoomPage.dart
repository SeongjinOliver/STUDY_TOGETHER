import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:study_together/pages/studyTogether.dart';
import 'package:study_together/service/studyService.dart';

import '../config/studyTogetherColors.dart';

class MakeRoomPage extends StatefulWidget {
  const MakeRoomPage({Key? key}) : super(key: key);

  @override
  State<MakeRoomPage> createState() => _MakeRoomPageState();
}

class _MakeRoomPageState extends State<MakeRoomPage> {
  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    // if (picked != null)
    //   setState(() {
    //     selectedDate = picked;
    //     _dateController.text = DateFormat.yMd().format(selectedDate);
    //   });
  }

  String studyTypeDropdownValue = '정규 스터디';
  String onOffLineDropdownValue = '온라인';
  DateTime startDateValue = DateTime.now();
  DateTime finishDateValue = DateTime.now();
  String fieldDropdownValue = '분야 무관';
  String memberCountDropdownValue = '1';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController attendanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isError = false;
    return Consumer<StudyService>(
      builder: (context, studyService, child) {
        final StudyService studyService = context.read<StudyService>();
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        hintText: "제목을 입력하세요",
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: StudyTogetherColors.color4),
                        ),
                      ),
                      // style: TextStyle(
                      //   fontSize: 10,
                      //   height: 10,
                      // ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          "스터디 유형",
                        ),
                        SizedBox(width: 10),
                        DropdownButton(
                          value: studyTypeDropdownValue,
                          items: <String>[
                            '정규 스터디',
                            '즉시 스터디',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              studyTypeDropdownValue = newValue!;
                            });
                          },
                          elevation: 16,
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
                          "온/오프라인",
                        ),
                        SizedBox(width: 10),
                        DropdownButton(
                          value: onOffLineDropdownValue,
                          items: <String>['온라인', '오프라인']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
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
                          "분야",
                        ),
                        SizedBox(width: 50),
                        DropdownButton(
                          value: fieldDropdownValue,
                          items: <String>[
                            '분야 무관',
                            'IT/개발',
                            '경제/투자',
                            '수능/고시',
                            '디자인',
                            '외국어',
                            '자격증',
                            '창업'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              fieldDropdownValue = newValue!;
                            });
                          },
                          elevation: 16,
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
                            '10'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 15),
                              ),
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
                    Divider(
                      color: Colors.grey[200],
                      // height: 1,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(5),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                          print('change $date');
                          startDateValue = date;
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.ko);
                      },
                      child: Text(
                        '시작 시간 설정하기',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(5),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                          print('change $date');
                          finishDateValue = date;
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.ko);
                      },
                      child: Text(
                        '종료 시간 설정하기',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "설명글",
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 5,
                      decoration: InputDecoration(
                        // fillColor: Colors.blueAccent,
                        filled: true,
                        hintText: "스터디의 기간, 요일, 시간을 명시해주세요.",
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "참여 방법",
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: attendanceController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                        // fillColor: Colors.blueAccent,
                        filled: true,
                        hintText:
                            "정규 스터디는 오픈채팅방 링크, 즉시스터디는 zoom, gather중 하나의 url을 남겨주세요.",
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: StudyTogetherColors.color4,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            // 방 만들기
                            studyService.makeStudyRoomType(
                              title: titleController.text,
                              studyType: studyTypeDropdownValue,
                              onOffLine: onOffLineDropdownValue,
                              startDate: startDateValue,
                              finishDate: finishDateValue,
                              field: fieldDropdownValue,
                              currentMemberCount: 1, // 최초 방 만들 때는 방장 한명
                              memberMaxCount:
                                  int.parse(memberCountDropdownValue),
                              description: descriptionController.text,
                              attendance: attendanceController.text,
                              onError: (err) {
                                // 에러 발생
                                isError = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(err),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.7),
                                  ),
                                );
                              },
                            );
                            if (!isError) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudyTogether(
                                      studyTypeDropdownValue == '정규 스터디'
                                          ? 1
                                          : 2),
                                ),
                              );
                            }
                          },
                          child: const Text('방 만들기'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: StudyTogetherColors.color4,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return object of type Dialog
                                return AlertDialog(
                                  title: Text("경고"),
                                  content:
                                      Text("현재까지 쓴 글이 삭제 됩니다. 그래도 취소 하시겠습니까?"),
                                  actions: [
                                    // 취소 버튼
                                    TextButton(
                                      child: Text(
                                        "취소",
                                        style: TextStyle(
                                          color: StudyTogetherColors.color2,
                                        ),
                                      ),
                                      onPressed: () => {
                                        Navigator.pop(context),
                                      },
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StudyTogether(0),
                                          ),
                                        );
                                        // Navigator.pop(context);
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
          ),
        );
      },
    );
  }
}
