import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// firestore에서 과목들의 '학기' 정보들을 가져와서, 입력한 매개변수인 학기 리스트에 넣기
// ex) 학기 정보를 표시하는 졸업요건들
Future<void> getSubjectsSemester(
    FirebaseFirestore db,
    FirebaseAuth auth,
    String requirement,
    List<String> selectedSemester,
    List<String> subjectNames) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  final collection =
      db.collection("usersRequirements").doc(uid).collection(requirement);
  await Future.forEach(subjectNames.asMap().entries, (entry) async {
    final doc = await collection.doc(entry.value).get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      selectedSemester[entry.key] = data["학기"];
    } else {
      selectedSemester[entry.key] = '0-0';
    }
  });
}

// firestore에서 특정 과목의 '학기' 정보를 가져와서, 입력한 매개변수인 학기 리스트에 넣기
// ex) 학기 정보를 표시하는 졸업요건들
Future<void> getSubjectSemester(
    FirebaseFirestore db,
    FirebaseAuth auth,
    String requirement,
    List<String> selectedSemester,
    int index,
    String subjectName) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  final doc = await db
      .collection("usersRequirements")
      .doc(uid)
      .collection(requirement)
      .doc(subjectName)
      .get();

  if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
    selectedSemester[index] = data["학기"];
  } else {
    selectedSemester[index] = '0-0';
  }
}

// firestore에서 특정 과목의 존재여부를 가져와서
// 존재하면 입력한 매개변수인 isCheckedPass에 true, 존재하지 않으면 입력한 false 넣기
// ex) 코딩부트캠프
Future<bool?> isExisted(FirebaseFirestore db, FirebaseAuth auth,
    String requirement, String subjectName) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return null;
  }

  final doc = await db
      .collection("usersRequirements")
      .doc(uid)
      .collection(requirement)
      .doc(subjectName)
      .get();

  if (doc.exists) {
    return true;
  } else {
    return false;
  }
}

// firestore에 과목 등록하기
Future<void> setSubject(FirebaseFirestore db, FirebaseAuth auth,
    String requirement, String subjectName, int credit, String semester,
    {int? designCredit}) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  Map<String, Object> subject;
  if (designCredit != null) {
    subject = <String, Object>{
      "과목명": subjectName,
      "학점": credit,
      "학기": semester,
      "설계학점": designCredit,
    };
  } else {
    subject = <String, Object>{
      "과목명": subjectName,
      "학점": credit,
      "학기": semester,
    };
  }

  await db
      .collection("usersRequirements")
      .doc(uid)
      .collection(requirement)
      .doc(subjectName)
      .set(subject)
      .onError((e, _) => print("Error writing document: $e"));
}

// firestore에서 과목 삭제하기
Future<void> deleteSubject(FirebaseFirestore db, FirebaseAuth auth,
    String requirement, String subjectName) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  await db
      .collection("usersRequirements")
      .doc(uid)
      .collection(requirement)
      .doc(subjectName)
      .delete();
}
