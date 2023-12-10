import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Major.dart';
import '../sideMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Progress.dart';
import '../ProgressBar.dart';
import '../FirestoreManager.dart';

class MajorRequired extends StatelessWidget {
  const MajorRequired({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '전공 필수',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/Menu.png')),
          )
        ],
      ),
      body: const MajorRequiredPage(),
      endDrawer: const SideMenu(),
    );
  }
}

class MajorRequiredPage extends StatefulWidget {
  const MajorRequiredPage({super.key});

  @override
  State<MajorRequiredPage> createState() => _MajorRequiredPageState();
}

class _MajorRequiredPageState extends State<MajorRequiredPage> {
  final _listSemester = [
    '0-0',
    '1-1',
    '1-2',
    '2-1',
    '2-2',
    '3-1',
    '3-2',
    '4-1',
    '4-2',
    '5-1',
    '5-2',
    '6-1',
    '6-2'
  ];
  final _selectedSemester = List<String>.filled(6, '0-0');
  final _subjectNames = [
    "자료구조",
    "컴퓨터구조",
    "프로그래밍언어론",
    "소프트웨어공학",
    "알고리즘",
    "운영체제"
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  @override
  void initState() {
    super.initState();
    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture =
        getSubjectsSemester(db, auth, "majorRequired", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "majorRequired");

    return FutureBuilder(
      future: _getSubjectsSemesterFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF54A9F6), Color(0xFF93CBFF)])),
            child: Center(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ProgressBar(
                    currentProgress: context.select((Progress p) =>
                        p.requirementsProgress["majorRequired"]!),
                    maxProgress:
                        context.select((Progress p) => p.majorRequiredMax),
                    width: 350,
                    height: 30,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/MajorRequiredEx.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('자료구조',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[0].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "자료구조", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "자료구조");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  0,
                                  "자료구조");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('컴퓨터구조',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[1].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "컴퓨터구조", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "컴퓨터구조");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  1,
                                  "컴퓨터구조");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('프로그래밍언어론',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[2].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "프로그래밍언어론", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "프로그래밍언어론");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  2,
                                  "프로그래밍언어론");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('소프트웨어공학',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[3].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "소프트웨어공학", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "소프트웨어공학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  3,
                                  "소프트웨어공학");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('알고리즘',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[4].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "알고리즘", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "알고리즘");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  4,
                                  "알고리즘");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 36,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                            child: Text('운영체제',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 36,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[5].toString(),
                            items: _listSemester
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: (grade == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(grade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "majorRequired",
                                    "운영체제", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "majorRequired", "운영체제");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "majorRequired",
                                  _selectedSemester,
                                  5,
                                  "운영체제");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
