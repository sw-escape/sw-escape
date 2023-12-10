import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Progress.dart';
import '../FirestoreManager.dart';

import '../sideMenu.dart';
import '../widgets.dart';
import 'common_info.dart';

class CoreLiberalArts extends StatefulWidget {
  const CoreLiberalArts({super.key});

  @override
  State<CoreLiberalArts> createState() => _CoreLiberalArtsState();
}

class _CoreLiberalArtsState extends State<CoreLiberalArts> {
  bool? challengeIsFilled = false;
  bool? creativityIsFilled = false;
  bool? convergenceIsFilled = false;
  bool? credibilityIsFilled = false;
  bool? communicationIsFilled = false;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> checkExistedData() async {
    challengeIsFilled = await isExisted(db, auth, "core", "도전");
    creativityIsFilled = await isExisted(db, auth, "core", "창의");
    convergenceIsFilled = await isExisted(db, auth, "core", "융합");
    credibilityIsFilled = await isExisted(db, auth, "core", "신뢰");
    communicationIsFilled = await isExisted(db, auth, "core", "소통");
    challengeIsFilled ??= false;
    creativityIsFilled ??= false;
    convergenceIsFilled ??= false;
    credibilityIsFilled ??= false;
    communicationIsFilled ??= false;
  }

  numChecked(List<bool?> checkList) {
    int count = 0;
    for (bool? value in checkList) {
      if (value == true) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "core");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '핵심 교양',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: SideMenu(),
      // challengeIsFilled/creativityIsFilled/convergenceIsFilled/credibilityIsFilled/communicationIsFilled
      body: FutureBuilder(
        future: checkExistedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              // color: Colors.blue,
              color: const Color(0xFF72BBFF),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15),
                        child: Description(
                            description: '5개 영역에서 각 한 과목 이상 이수', height: 65),
                      ),
                      // if (context.watch<CommonInfo>().filledCount == 0)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          0)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.0,
                            center: Text('0%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.watch<CommonInfo>().filledCount == 1)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          1)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.2,
                            center: Text('20%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.watch<CommonInfo>().filledCount == 2)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          2)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.4,
                            center: Text('40%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.watch<CommonInfo>().filledCount == 3)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          3)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.6,
                            center: Text('60%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.watch<CommonInfo>().filledCount == 4)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          4)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.8,
                            center: Text('80%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.watch<CommonInfo>().filledCount == 5)
                      if (numChecked([
                            challengeIsFilled,
                            creativityIsFilled,
                            convergenceIsFilled,
                            credibilityIsFilled,
                            communicationIsFilled
                          ]) ==
                          5)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 1.0,
                            center: Text('100%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            margin: const EdgeInsets.all(15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black), // 검정 테두리
                              color: Colors.white, // 하얀색 배경
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '도전',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                                Checkbox(
                                  // value: context.read<CommonInfo>().challengeIsFilled,
                                  value: challengeIsFilled,
                                  visualDensity: VisualDensity(
                                    horizontal: -2, // 가로 크기
                                    vertical: -2, // 세로 크기
                                  ),
                                  onChanged: (newValue) async {
                                    // 체크하는 경우
                                    if (newValue == true) {
                                      await setSubject(
                                          db, auth, "core", "도전", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(
                                          db, auth, "core", "도전");
                                    }
                                    setState(() {
                                      // context.read<CommonInfo>().fillChallenge();
                                      // context.read<CommonInfo>().countFilledSkills();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 120, // 원하는 너비 값으로 수정하세요
                                  child: TextButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'http://ge.cau.ac.kr/course_list_haksim_1.php');
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    child: Text(
                                      '과목 확인',
                                      style: TextStyle(
                                        color: Colors.black, // 텍스트 색상
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white), // 배경색상
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: Colors.black), // 테두리 색상 및 굵기
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 160,
                            margin: const EdgeInsets.all(15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black), // 검정 테두리
                              color: Colors.white, // 하얀색 배경
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '창의',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                                Checkbox(
                                  // value: context.read<CommonInfo>().creativityIsFilled,
                                  value: creativityIsFilled,
                                  visualDensity: VisualDensity(
                                    horizontal: -2, // 가로 크기
                                    vertical: -2, // 세로 크기
                                  ),
                                  onChanged: (newValue) async {
                                    // 체크하는 경우
                                    if (newValue == true) {
                                      await setSubject(
                                          db, auth, "core", "창의", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(
                                          db, auth, "core", "창의");
                                    }
                                    setState(() {
                                      // context.read<CommonInfo>().fillCreativity();
                                      // context.read<CommonInfo>().countFilledSkills();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 120, // 원하는 너비 값으로 수정하세요
                                  child: TextButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'http://ge.cau.ac.kr/course_list_haksim_1.php');
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    child: Text(
                                      '과목 확인',
                                      style: TextStyle(
                                        color: Colors.black, // 텍스트 색상
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white), // 배경색상
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: Colors.black), // 테두리 색상 및 굵기
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            margin: const EdgeInsets.all(15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black), // 검정 테두리
                              color: Colors.white, // 하얀색 배경
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '융합',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                                Checkbox(
                                  // value: context.read<CommonInfo>().convergenceIsFilled,
                                  value: convergenceIsFilled,
                                  visualDensity: VisualDensity(
                                    horizontal: -2, // 가로 크기
                                    vertical: -2, // 세로 크기
                                  ),
                                  onChanged: (newValue) async {
                                    // 체크하는 경우
                                    if (newValue == true) {
                                      await setSubject(
                                          db, auth, "core", "융합", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(
                                          db, auth, "core", "융합");
                                    }
                                    setState(() {
                                      // context.read<CommonInfo>().fillConvergence();
                                      // context.read<CommonInfo>().countFilledSkills();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 120, // 원하는 너비 값으로 수정하세요
                                  child: TextButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'http://ge.cau.ac.kr/course_list_haksim_3.php');
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    child: Text(
                                      '과목 확인',
                                      style: TextStyle(
                                        color: Colors.black, // 텍스트 색상
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white), // 배경색상
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: Colors.black), // 테두리 색상 및 굵기
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 160,
                            margin: const EdgeInsets.all(15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black), // 검정 테두리
                              color: Colors.white, // 하얀색 배경
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '신뢰',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                                Checkbox(
                                  // value: context.read<CommonInfo>().credibilityIsFilled,
                                  value: credibilityIsFilled,
                                  visualDensity: VisualDensity(
                                    horizontal: -2, // 가로 크기
                                    vertical: -2, // 세로 크기
                                  ),
                                  onChanged: (newValue) async {
                                    // 체크하는 경우
                                    if (newValue == true) {
                                      await setSubject(
                                          db, auth, "core", "신뢰", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(
                                          db, auth, "core", "신뢰");
                                    }
                                    setState(() {
                                      // context.read<CommonInfo>().fillCredibility();
                                      // context.read<CommonInfo>().countFilledSkills();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 120, // 원하는 너비 값으로 수정하세요
                                  child: TextButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'http://ge.cau.ac.kr/course_list_haksim_4.php');
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    child: Text(
                                      '과목 확인',
                                      style: TextStyle(
                                        color: Colors.black, // 텍스트 색상
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white), // 배경색상
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                            color: Colors.black), // 테두리 색상 및 굵기
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 160,
                        margin: const EdgeInsets.all(15),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black), // 검정 테두리
                          color: Colors.white, // 하얀색 배경
                        ),
                        child: Column(
                          children: [
                            Text(
                              '소통',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                            Checkbox(
                              // value: context.read<CommonInfo>().communicationIsFilled,
                              value: communicationIsFilled,
                              visualDensity: VisualDensity(
                                horizontal: -2, // 가로 크기
                                vertical: -2, // 세로 크기
                              ),
                              onChanged: (newValue) async {
                                // 체크하는 경우
                                if (newValue == true) {
                                  await setSubject(
                                      db, auth, "core", "소통", 0, "0-0");
                                }
                                // 체크를 해제하는 경우
                                else {
                                  await deleteSubject(db, auth, "core", "소통");
                                }
                                setState(() {
                                  // context.read<CommonInfo>().fillCommunication();
                                  // context.read<CommonInfo>().countFilledSkills();
                                });
                              },
                            ),
                            SizedBox(
                              width: 120, // 원하는 너비 값으로 수정하세요
                              child: TextButton(
                                onPressed: () async {
                                  final url = Uri.parse(
                                      'http://ge.cau.ac.kr/course_list_haksim_5.php');
                                  if (await canLaunchUrl(url)) {
                                    launchUrl(url);
                                  }
                                },
                                child: Text(
                                  '과목 확인',
                                  style: TextStyle(
                                    color: Colors.black, // 텍스트 색상
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white), // 배경색상
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                        color: Colors.black), // 테두리 색상 및 굵기
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //const ProgressBar(),
                      //const CommonMenu(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
