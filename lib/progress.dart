import 'package:flutter/material.dart';

class Progress with ChangeNotifier {

  // 전공 기초
  int basicMajorProgress = 75;
  int maxBasicMajorProgress = 100;

  // 전공
  int majorProgress = 85;
  int maxMajorProgress = 100;

  // 기타
  int etcProgress = 60;
  int maxEtcProgress = 100;

  // 공통 졸업 조건
  int commonProgress = 50;
  int maxCommonProgress = 100;
}