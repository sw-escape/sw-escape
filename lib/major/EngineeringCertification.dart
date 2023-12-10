import 'package:flutter/material.dart';
import '../sideMenu.dart';
import 'package:provider/provider.dart';
import '../Major.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../FirestoreManager.dart';
import '../Progress.dart';
import '../ProgressBar.dart';
import '../widgets.dart';

class EngineeringCertification extends StatelessWidget {
  const EngineeringCertification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '공학인증 필수과목',
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
      body: const EngineeringCertificationPage(),
      endDrawer: SideMenu(),
    );
  }
}

class EngineeringCertificationPage extends StatefulWidget {
  const EngineeringCertificationPage({super.key});

  @override
  State<EngineeringCertificationPage> createState() =>
      _EngineeringCertificationPageState();
}

class _EngineeringCertificationPageState
    extends State<EngineeringCertificationPage> {
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
  final _selectedSemester = List<String>.filled(5, '0-0');
  final _subjectNames = [
    "이산수학",
    "자료구조",
    "컴퓨터구조",
    "알고리즘",
    "운영체제",
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  @override
  void initState() {
    super.initState();
    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture = getSubjectsSemester(
        db, auth, "engineeringCertification", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context
        .read<Progress>()
        .loadNumberProgress(db, auth, "engineeringCertification");

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
                        p.requirementsProgress["engineeringCertification"]!),
                    maxProgress: context
                        .select((Progress p) => p.engineeringCertificationMax),
                    width: 350,
                    height: 30,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Description(
                      description: '공학 인증 이수를 위해 수강해야 하는 5과목', height: 55),
                  const SizedBox(
                    height: 80,
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
                            child: Text('이산수학',
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
                                  (semester) => DropdownMenuItem(
                                    value: semester,
                                    child: (semester == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(semester,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "engineeringCertification",
                                    "이산수학",
                                    3,
                                    semester!);
                              } else {
                                await deleteSubject(db, auth,
                                    "engineeringCertification", "이산수학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "engineeringCertification",
                                  _selectedSemester,
                                  0,
                                  "이산수학");
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
                            value: _selectedSemester[1].toString(),
                            items: _listSemester
                                .map(
                                  (semester) => DropdownMenuItem(
                                    value: semester,
                                    child: (semester == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(semester,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "engineeringCertification",
                                    "자료구조",
                                    3,
                                    semester!);
                              } else {
                                await deleteSubject(db, auth,
                                    "engineeringCertification", "자료구조");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "engineeringCertification",
                                  _selectedSemester,
                                  1,
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
                            value: _selectedSemester[2].toString(),
                            items: _listSemester
                                .map(
                                  (semester) => DropdownMenuItem(
                                    value: semester,
                                    child: (semester == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(semester,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "engineeringCertification",
                                    "컴퓨터구조",
                                    3,
                                    semester!);
                              } else {
                                await deleteSubject(db, auth,
                                    "engineeringCertification", "컴퓨터구조");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "engineeringCertification",
                                  _selectedSemester,
                                  2,
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
                            value: _selectedSemester[3].toString(),
                            items: _listSemester
                                .map(
                                  (semester) => DropdownMenuItem(
                                    value: semester,
                                    child: (semester == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(semester,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "engineeringCertification",
                                    "알고리즘",
                                    3,
                                    semester!);
                              } else {
                                await deleteSubject(db, auth,
                                    "engineeringCertification", "알고리즘");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "engineeringCertification",
                                  _selectedSemester,
                                  3,
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
                            value: _selectedSemester[4].toString(),
                            items: _listSemester
                                .map(
                                  (semester) => DropdownMenuItem(
                                    value: semester,
                                    child: (semester == '0-0')
                                        ? const Text('학기',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text(semester,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                                .toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "engineeringCertification",
                                    "운영체제",
                                    3,
                                    semester!);
                              } else {
                                await deleteSubject(db, auth,
                                    "engineeringCertification", "운영체제");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "engineeringCertification",
                                  _selectedSemester,
                                  4,
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
