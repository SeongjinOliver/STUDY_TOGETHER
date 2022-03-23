import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudyService extends ChangeNotifier {
  final bucketCollection = FirebaseFirestore.instance.collection('study_room');

  Future<QuerySnapshot> read(String uid) async {
    // 내 bucketList 가져오기
    throw UnimplementedError(); // return 값 미구현 에러
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

  void makeStudyRoomType({
    required String title,
    required String onOffLine,
    required DateTime startDate,
    required DateTime finishDate,
    required String field,
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

    await bucketCollection.add({
      'title': title,
      'onOffLine': onOffLine,
      'startDate': startDate,
      'finishDate': finishDate,
      'field': field,
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
