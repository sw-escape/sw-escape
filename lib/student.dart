import 'package:flutter/material.dart';

class Student with ChangeNotifier {
  String id = 'userid';
  String department = '소프트웨어';
  int entranceYear = 21;
  String character = 'assets/images/glasses_girl.png';
  String? selectedStudentID; // 추가된 필드

  setInfo(String id, String dept, int year) {
    this.id = id;
    this.department = dept;
    this.entranceYear = year;
    notifyListeners();
  }

  setSelectedStudentID(String? id) {
    this.selectedStudentID = id; // selectedStudentID 업데이트
    notifyListeners();
  }

  setCharacter(String chr) {
    character = chr;
    notifyListeners();
  }
}

