import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Progress with ChangeNotifier {

  final requirementsProgress = {
    "basicMajor": 0,
    "majorRequired": 0,
    "engineeringCertification": 0,
    "designSubject": 0,
    "bsm": 0,
    "etcMajor": 0,
    "codingBootCampDialog": 0,
    "graduateThesisTopcitDialog": 0,
    "capstone": 0,
    "machCourseDialog": 0,
    "lowestGraduateGPADialog": 0,
    "professorInterviewDialog": 0,
    "english": 0,
    "chinese": 0,
    "common": 0,
    "core": 0,
  };

  // 전공 기초
  int basicMajorMax = 14;                // 전공 기초

  // 전공
  int majorRequiredMax = 6;              // 전공 필수
  int engineeringCertificationMax = 5;   // 공학인증 필수과목
  int designSubjectMax = 14;             // 설계 학점
  int bsmMax = 18;                       // BSM
  int etcMajorMax = 84;                  // 기타 전공 과목

  // 기타
  int codingBootCampDialogMax = 1;       // 코딩부트캠프
  int graduateThesisTopcitDialogMax = 1; // 졸업논문/TOPCIT
  int capstoneMax = 1;                   // 캡스톤/인턴/학부연구생
  int machCourseDialogMax = 4;           // MACH 교양
  int lowestGraduateGPADialogMax = 1;    // 최저 졸업 평점
  int professorInterviewDialogMax = 4;   // 교수님 면담 4회

  // 공통 졸업 조건
  int englishMax = 1;                    // 영어
  int chineseMax = 1;                    // 한자
  int commonMax = 5;                     // 공통 교양
  int coreMax = 5;                       // 핵심 교양


  // 항목별 학점 총합 가져오기
  loadCreditProgress(FirebaseFirestore db, FirebaseAuth auth, String requirement) async {

    User? user = auth.currentUser;
    String uid;
    if(user != null) {
      uid = user.uid;
    } else {
      return;
    }

    QuerySnapshot querySnapshot = await db.collection("users").doc(uid).collection(requirement).get();
    int totalCredit = 0;
    for(QueryDocumentSnapshot document in querySnapshot.docs) {
      if (document.data() is Map<String, dynamic>) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        // 'credit' 필드가 존재하면 해당 값을 더함
        if(data.containsKey('학점')){
          totalCredit += document['학점'] as int;
        }
      }
    }
    requirementsProgress.update(requirement, (value) => totalCredit, ifAbsent: () => totalCredit);
    notifyListeners();
  }

  // 항목별 개수 총합 가져오기
  loadNumberProgress(FirebaseFirestore db, FirebaseAuth auth, String requirement) async {

    User? user = auth.currentUser;
    String uid;
    if(user != null) {
      uid = user.uid;
    } else {
      return;
    }

    QuerySnapshot querySnapshot = await db.collection("users").doc(uid).collection(requirement).get();
    requirementsProgress.update(requirement, (value) => querySnapshot.size, ifAbsent: () => querySnapshot.size);
    notifyListeners();
  }
}