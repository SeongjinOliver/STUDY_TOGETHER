import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudyService extends ChangeNotifier {
  final studyTogetherCollection =
      FirebaseFirestore.instance.collection('study_room');

  Future<QuerySnapshot> read(String studyType) async {
    // 내 bucketList 가져오기
    return studyTogetherCollection
        .where('studyType', isEqualTo: studyType)
        .get();
  }

  void create(String job, String uid) async {
    // bucket 만들기
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
  }

  void delete(String docId) async {
    // bucket 삭제
  }

  // 방 만들기
  void makeStudyRoomType({
    required String title,
    required String studyType,
    required String onOffLine,
    required DateTime startDate,
    required DateTime finishDate,
    required String field,
    required int currentMemberCount,
    required int memberMaxCount,
    required String description,
    required String attendance,
    required Function(String err) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 방 만들기
    if (title.isEmpty) {
      onError("제목을 입력해 주세요.");
      return;
    } else if (description.isEmpty) {
      onError("설명글을 작성해 주세요.");
      return;
    } else if (attendance.isEmpty) {
      onError("참여 방법을 남겨주세요.");
      return;
    }

    await studyTogetherCollection.add({
      'title': title,
      'studyType': studyType,
      'onOffLine': onOffLine,
      'startDate': startDate,
      'finishDate': finishDate,
      'field': field,
      'currentMemberCount': currentMemberCount,
      'memberMaxCount': memberMaxCount,
      'description': description,
      'attendance': attendance,
    });
    notifyListeners(); // 화면 갱신
  }

  // void signUp({
  //   required String email, // 이메일
  //   required String password, // 비밀번호
  //   required Function onSuccess, // 가입 성공시 호출되는 함수
  //   required Function(String err) onError, // 에러 발생시 호출되는 함수
  // }) async {
  //   // 회원가입
  // }

  // void signIn({
  //   required String email, // 이메일
  //   required String password, // 비밀번호
  //   required Function onSuccess, // 로그인 성공시 호출되는 함수
  //   required Function(String err) onError, // 에러 발생시 호출되는 함수
  // }) async {
  //   // 로그인
  // }

  // void signOut() async {
  //   // 로그아웃
  // }
}
