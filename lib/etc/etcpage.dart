import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/etc/CodingBootCamp.dart';
import 'package:sw_escape/etc/GraduateThesisTopcit.dart';
import 'package:sw_escape/etc/CapstoneInternURS.dart';
import 'package:sw_escape/etc/LowestGraduateGPA.dart';
import 'package:sw_escape/etc/MACHCourses.dart';
import 'package:sw_escape/etc/ProfessorInterview.dart';
import '../Progress.dart';
import '../ProgressBar.dart';

import '../sideMenu.dart';

class EtcPage extends StatelessWidget {
  const EtcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/swescape_title.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/Menu.png')),
          )
        ],
      ),
      endDrawer: SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: Column(
          children: [
            // ProgressBar(
            //   currentProgress: context.select((Progress p) => p.majorRequiredProgress),
            //   maxProgress: context.select((Progress p) => p.majorRequiredProgressMax),
            //   width: 120.0,
            //   height: 20.0,
            //   color: const Color(0xFF76DF6D),
            // ),
            Container(
              height: 20,
              // color: Colors.indigo,
            ),
            EtcMenu(),
          ],
        ),
      ),
    );
  }
}

class EtcMenu extends StatelessWidget {
  EtcMenu({super.key});

  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context
        .read<Progress>()
        .loadNumberProgress(db, auth, "codingBootCampDialog");
    context
        .read<Progress>()
        .loadNumberProgress(db, auth, "graduateThesisTopcitDialog");
    context.read<Progress>().loadNumberProgress(db, auth, "capstone");
    context.read<Progress>().loadNumberProgress(db, auth, "machCourseDialog");
    context
        .read<Progress>()
        .loadNumberProgress(db, auth, "lowestGraduateGPADialog");
    context
        .read<Progress>()
        .loadNumberProgress(db, auth, "professorInterviewDialog");

    return Column(
      // Column은 기본적으로 수평 정렬
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CodingBootCampDialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/code.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select((Progress p) =>
                          p.requirementsProgress["codingBootCampDialog"]!),
                      maxProgress: context
                          .select((Progress p) => p.codingBootCampDialogMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.red,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              '코딩부트캠프',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return GraduateThesisTopcitDialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 10),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/pencil.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select((Progress p) => p
                          .requirementsProgress["graduateThesisTopcitDialog"]!),
                      maxProgress: context.select(
                          (Progress p) => p.graduateThesisTopcitDialogMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.orange,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              '졸업논문/TOPCIT',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CapInternURSDialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 20),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/light.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select(
                          (Progress p) => p.requirementsProgress["capstone"]!),
                      maxProgress:
                          context.select((Progress p) => p.capstoneMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.yellow,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              '캡스톤/인턴/학부연구생',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MACHCourseDialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 25),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/book.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select((Progress p) =>
                          p.requirementsProgress["machCourseDialog"]!),
                      maxProgress:
                          context.select((Progress p) => p.machCourseDialogMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.green,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'MACH 교양',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LowestGraduateGPADialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 9, right: 20),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/grades.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select((Progress p) =>
                          p.requirementsProgress["lowestGraduateGPADialog"]!),
                      maxProgress: context
                          .select((Progress p) => p.lowestGraduateGPADialogMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.blue,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              '최저 졸업 평점',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProfessorInterviewDialog();
                }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/guardian.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                      currentProgress: context.select((Progress p) =>
                          p.requirementsProgress["professorInterviewDialog"]!),
                      maxProgress: context.select(
                          (Progress p) => p.professorInterviewDialogMax),
                      width: 205.0,
                      height: 20.0,
                      color: Colors.purpleAccent,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              '교수님 면담',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
