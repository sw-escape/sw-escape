import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> getUserInfo(
    FirebaseFirestore db,
    FirebaseAuth auth,
    String collection,
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
      .collection("users")
      .doc(uid)
      .collection(collection)
      .doc(subjectName)
      .get();

  if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
    selectedSemester[index] = data["학기"];
  } else {
    selectedSemester[index] = '0-0';
  }
}

// firestore에서 과목들의 '학기' 정보 가져오기
Future<void> getSubjectsSemester(FirebaseFirestore db, FirebaseAuth auth,
    List<String> selectedSemester, List<String> subjectNames) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  final collection =
      db.collection("users").doc(uid).collection("majorRequired");
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

// firestore에서 특정 과목만의 '학기' 정보 가져오기
Future<void> getSubjectSemester(
    FirebaseFirestore db,
    FirebaseAuth auth,
    String collection,
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
      .collection("users")
      .doc(uid)
      .collection(collection)
      .doc(subjectName)
      .get();

  if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
    selectedSemester[index] = data["학기"];
  } else {
    selectedSemester[index] = '0-0';
  }
}

// firestore에 과목 등록하기
Future<void> setSubject(FirebaseFirestore db, FirebaseAuth auth,
    String collection, String subjectName, int credit, String semester,
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
      .collection("users")
      .doc(uid)
      .collection(collection)
      .doc(subjectName)
      .set(subject)
      .onError((e, _) => print("Error writing document: $e"));
}

// firestore에서 과목 삭제하기
Future<void> deleteSubject(FirebaseFirestore db, FirebaseAuth auth,
    String collection, String subjectName) async {
  User? user = auth.currentUser;
  String uid;
  if (user != null) {
    uid = user.uid;
  } else {
    return;
  }

  await db
      .collection("users")
      .doc(uid)
      .collection(collection)
      .doc(subjectName)
      .delete();
}
