import 'package:flutter/material.dart';

class Progress with ChangeNotifier {

  // 전공 기초
  int basicMajorProgress = 3;
  int basicMajorProgressMax = 14;

  // 전공
  // 전공필수
  int majorRequiredProgress = 2;
  int majorRequiredProgressMax = 6;
  // 공학인증 필수과목
  int engineeringCertificationProgress = 4;
  int engineeringCertificationProgressMax = 5;
  // 설계 학점
  int designSubjectProgress = 1;
  int designSubjectProgressMax = 14;
  // BSM
  int bsmProgress = 3;
  int bsmProgressMax = 18;
  // 기타 전공 과목
  int etcMajorProgress = 39;
  int etcMajorProgressMax = 84;

  // 기타
  // 코딩부트캠프
  int codingBootCampDialogProgress = 1;
  int codingBootCampDialogProgressMax = 1;
  // 졸업논문/TOPCIT
  int graduateThesisTopcitDialogProgress = 1;
  int graduateThesisTopcitDialogProgressMax = 1;
  // 캡스톤/인턴/학부연구생
  int capstoneProgress = 1;
  int capstoneProgressMax = 1;
  // MACH 교양
  int machCourseDialogProgress = 3;
  int machCourseDialogProgressMax = 4;
  // 최저 졸업 평점
  int lowestGraduateGPADialogProgress = 1;
  int lowestGraduateGPADialogProgressMax = 1;
  // 교수님 면담 4회
  int professorInterviewDialogProgress = 1;
  int professorInterviewDialogProgressMax = 4;

  // 공통 졸업 조건
  // 영어
  int englishProgress = 1;
  int englishProgressMax = 1;
  // 한자
  int chineseProgress = 1;
  int chineseProgressMax = 1;
  // 공통 교양
  int commonProgress = 3;
  int commonProgressMax = 5;
  // 핵심 교양
  int coreProgress = 2;
  int coreProgressMax = 5;

}