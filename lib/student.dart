import 'package:flutter/material.dart';

class Student with ChangeNotifier {
  String id = 'userid';
  String department = '소프트웨어';
  int entranceYear = 21;
  String character = 'assets/images/glasses_girl.png';

  setInfo(id, dept, year) {
    id = id;
    department = dept;
    entranceYear = year;
    notifyListeners();
  }

  setCharacter(chr) {
    character = chr;
    notifyListeners();
  }
}
