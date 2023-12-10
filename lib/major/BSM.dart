import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Major.dart';
import '../sideMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Progress.dart';
import '../ProgressBar.dart';
import '../FirestoreManager.dart';

class BSM extends StatelessWidget {
  const BSM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'BSM',
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
      body: const BSMPage(),
      endDrawer: SideMenu(),
    );
  }
}

class BSMPage extends StatefulWidget {
  const BSMPage({super.key});

  @override
  State<BSMPage> createState() => _BSMPageState();
}

class _BSMPageState extends State<BSMPage> {
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
    '6-2',
  ];
  final _selectedSemester = List<String>.filled(7, '0-0');
  final _subjectNames = [
    "일반물리(2)",
    "일반물리실험(1)",
    "미적분학",
    "선형대수학",
    "이산수학",
    "확률및통계",
    "수치해석",
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  @override
  void initState() {
    super.initState();
    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture =
        getSubjectsSemester(db, auth, "bsm", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadCreditProgress(db, auth, "bsm", false);

    return FutureBuilder(
      future: _getSubjectsSemesterFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
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
                    currentProgress: context.select((Progress p) => p.requirementsProgress["bsm"]!),
                    maxProgress: context.select((Progress p) => p.bsmMax),
                    width: 350,
                    height: 30,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/BSMEx.png'),
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
                            child: Text('일반물리(2)',
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                    "일반물리(2)", 2, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "bsm", "일반물리(2)");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "bsm",
                                  _selectedSemester,
                                  0,
                                  "일반물리(2)");
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
                            child: Text('일반물리실험(1)',
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                "일반물리실험(1)", 1, semester!);
                              } else {
                                await deleteSubject(
                                db, auth, "bsm", "일반물리실험(1)");
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "bsm",
                              _selectedSemester,
                              1,
                              "일반물리실험(1)");
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
                            child: Text('미적분학',
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                    "미적분학", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "bsm", "미적분학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "bsm",
                                  _selectedSemester,
                                  2,
                                  "미적분학");
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
                            child: Text('선형대수학',
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                "선형대수학", 3, semester!);
                              } else {
                                await deleteSubject(
                                db, auth, "bsm", "선형대수학");
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "bsm",
                              _selectedSemester,
                              3,
                              "선형대수학");
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                "이산수학", 3, semester!);
                              } else {
                                await deleteSubject(
                                db, auth, "bsm", "이산수학");
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "bsm",
                              _selectedSemester,
                              4,
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
                            child: Text('확률 및 통계',
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                "확률및통계", 3, semester!);
                              } else {
                                await deleteSubject(
                                db, auth, "bsm", "확률및통계");
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "bsm",
                              _selectedSemester,
                              5,
                              "확률및통계");
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
                            child: Text('수치해석',
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
                            value: _selectedSemester[6].toString(),
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
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(db, auth, "bsm",
                                "수치해석", 3, semester!);
                              } else {
                                await deleteSubject(
                                db, auth, "bsm", "수치해석");
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "bsm",
                              _selectedSemester,
                              6,
                              "수치해석");
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
