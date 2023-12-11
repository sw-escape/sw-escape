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
  int commonMax = 7;                     // 공통 교양
  int coreMax = 5;                       // 핵심 교양


  // 졸업 요건 별 학점 총합 가져오기
  loadCreditProgress(FirebaseFirestore db, FirebaseAuth auth, String requirement, bool isDesignCredit) async {
    print("$requirement load credit 호출");

    User? user = auth.currentUser;
    String uid;
    if(user != null) {
      uid = user.uid;
    } else {
      return;
    }

    QuerySnapshot querySnapshot = await db.collection("usersRequirements").doc(uid).collection(requirement).get();
    int totalCredit = 0;
    for(QueryDocumentSnapshot document in querySnapshot.docs) {
      if (document.data() is Map<String, dynamic>) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        if(isDesignCredit){
          // '설계학점' 필드가 존재하면 해당 값을 더함
          if(data.containsKey('설계학점')){
            totalCredit += document['설계학점'] as int;
          }
        } else {
          // '학점' 필드가 존재하면 해당 값을 더함
          if(data.containsKey('학점')){
            totalCredit += document['학점'] as int;
          }
        }
      }
    }
    requirementsProgress.update(requirement, (value) => totalCredit, ifAbsent: () => totalCredit);
    notifyListeners();
  }

  // int? getSemesterInt(QuerySnapshot querySnapshot, String docName) {
  //   // 문서 찾기
  //   QueryDocumentSnapshot? queryDocSnapshot;
  //   try {
  //     queryDocSnapshot = querySnapshot.docs.firstWhere(
  //           (doc) => doc.id == docName,
  //     );
  //   } catch (e) {
  //     queryDocSnapshot = null;
  //   }
  //   // 문서에서 "학기" 필드 값 가져오기
  //   String? semester;
  //   if (queryDocSnapshot != null) {
  //     if (queryDocSnapshot.data() is Map<String, dynamic>) {
  //       Map<String, dynamic> data = queryDocSnapshot.data() as Map<String, dynamic>;
  //       if(data.containsKey('학기')){
  //         semester = queryDocSnapshot['학기'] as String;
  //       }
  //     }
  //   }
  //   // 문서의 "학기" 값에서 '-'를 빼고, 숫자를 int? 형으로 가져오기
  //   String? semesterWithoutDash = semester?.replaceAll('-', '');
  //   int? semesterInt = semesterWithoutDash != null ? int.parse(semesterWithoutDash) : null;
  //
  //   return semesterInt;
  // }
  
  // 설계 과목들의 설계 학점 총합 가져오기
  // loadDesignCreditProgress(FirebaseFirestore db, FirebaseAuth auth, String requirement) async {
  //
  //   User? user = auth.currentUser;
  //   String uid;
  //   if(user != null) {
  //     uid = user.uid;
  //   } else {
  //     return;
  //   }
  //
  //   QuerySnapshot querySnapshot = await db.collection("usersRequirements").doc(uid).collection(requirement).get();
  //   int totalDesignCredit = 0;
  //   int? creativeDesignSemesterInt = getSemesterInt(querySnapshot, "창의적설계");
  //   int? capstone1SemesterInt = getSemesterInt(querySnapshot, "캡스톤디자인(1)");
  //   int? capstone2SemesterInt = getSemesterInt(querySnapshot, "캡스톤디자인(2)");
  //   int? capstoneSemesterInt;
  //   if(capstone1SemesterInt != null && capstone2SemesterInt != null) {
  //     if(capstone1SemesterInt > capstone2SemesterInt) {
  //       capstoneSemesterInt = capstone1SemesterInt;
  //     } else {
  //       capstoneSemesterInt = capstone2SemesterInt;
  //     }
  //   }
  //   // 창의적설계보다 학기가 낮으면 설계학점 안치고,
  //   // 캡스톤디자인 두개중 높은 학기보다 학기가 높으면 설계학점 안침
  //   for(QueryDocumentSnapshot document in querySnapshot.docs) {
  //     if (document.data() is Map<String, dynamic>) {
  //       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //       if(data.containsKey('학기') && data.containsKey('설계학점')){
  //         String semester = document['학기'] as String;
  //         String semesterWithoutDash = semester.replaceAll('-', '');
  //         int semesterInt = int.parse(semesterWithoutDash);
  //         // 창의적설계를 들었다면
  //         if(creativeDesignSemesterInt != null) {
  //           // 창의적설계 이후에 들어야 하고
  //           if(semesterInt >= creativeDesignSemesterInt) {
  //             // 캡스톤을 끝내지 않았다면
  //             if(capstoneSemesterInt == null) {
  //               String a = document['과목명'] as String;
  //               totalDesignCredit += document['설계학점'] as int;
  //             }
  //             // 캡스톤을 끝냈다면
  //             else {
  //               // 캡스톤 이전에 들어야 인정
  //               if(semesterInt <= capstoneSemesterInt) {
  //                 String a = document['과목명'] as String;
  //                 totalDesignCredit += document['설계학점'] as int;
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  //   requirementsProgress.update(requirement, (value) => totalDesignCredit, ifAbsent: () => totalDesignCredit);
  //   notifyListeners();
  // }

  // 졸업 요건 별 개수 총합 가져오기
  loadNumberProgress(FirebaseFirestore db, FirebaseAuth auth, String requirement) async {
    print("$requirement load number 호출");

    User? user = auth.currentUser;
    String uid;
    if(user != null) {
      uid = user.uid;
    } else {
      return;
    }

    QuerySnapshot querySnapshot = await db.collection("usersRequirements").doc(uid).collection(requirement).get();
    requirementsProgress.update(requirement, (value) => querySnapshot.size, ifAbsent: () => querySnapshot.size);
    notifyListeners();
  }
}