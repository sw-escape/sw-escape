import 'package:flutter/material.dart';

class CommonInfo with ChangeNotifier {
  bool isTOEICLevel5OrHigher = false;
  bool isEngA3rHigher = false;

  fillTOEICLevel5OrHigher() {
    isTOEICLevel5OrHigher = !isTOEICLevel5OrHigher;
    notifyListeners();
  }

  fillEngA3rHigher() {
    isEngA3rHigher = !isEngA3rHigher;
    notifyListeners();
  }

  bool isChineseCharL4 = false;
  bool hasAttendedChineseCharClass = false;

  fillChineseCharL4() {
    isChineseCharL4 = !isChineseCharL4;
    notifyListeners();
  }

  fillAttendedChineseCharClass() {
    hasAttendedChineseCharClass = !hasAttendedChineseCharClass;
    notifyListeners();
  }

  bool challengeIsFilled = false;
  bool creativityIsFilled = false;
  bool convergenceIsFilled = false;
  bool credibilityIsFilled = false;
  bool communicationIsFilled = false;

  fillChallenge() {
    challengeIsFilled = !challengeIsFilled;
    notifyListeners();
  }

  fillCreativity() {
    creativityIsFilled = !creativityIsFilled;
    notifyListeners();
  }

  fillConvergence() {
    convergenceIsFilled = !convergenceIsFilled;
    notifyListeners();
  }

  fillCredibility() {
    credibilityIsFilled = !credibilityIsFilled;
    notifyListeners();
  }

  fillCommunication() {
    communicationIsFilled = !communicationIsFilled;
    notifyListeners();
  }

  int filledCount = 0;
  countFilledSkills() {
    filledCount = 0;
    if (challengeIsFilled) filledCount++;
    if (creativityIsFilled) filledCount++;
    if (convergenceIsFilled) filledCount++;
    if (credibilityIsFilled) filledCount++;
    if (communicationIsFilled) filledCount++;
    notifyListeners();
  }
}
