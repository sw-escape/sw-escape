import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/widgets.dart';
import 'Major.dart';
import 'sideMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Progress.dart';
import 'ProgressBar.dart';
import 'FirestoreManager.dart';

class MajorBasic extends StatelessWidget {
  const MajorBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '전공 기초',
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
      body: const MajorBasicPage(),
      endDrawer: const SideMenu(),
    );
  }
}

class MajorBasicPage extends StatefulWidget {
  const MajorBasicPage({super.key});

  @override
  State<MajorBasicPage> createState() => _MajorBasicPageState();
}

class _MajorBasicPageState extends State<MajorBasicPage> {
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
  final _selectedSemester = List<String>.filled(8, '0-0');
  final _subjectNames = [
    "미적분",
    "일반물리(2)",
    "일반물리실험(1)",
    "기초컴퓨터프로그래밍",
    "논리회로",
    "선형대수학",
    "이산수학",
    "프로그래밍",
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  // final _selectedValue = List<double>.filled(8, 0.0);
  // double _progressValue = 0.0;
  // void _updateProgress(String value, int i) {
  //   setState(() {
  //     if (value == '0-0') {
  //       _selectedValue[i] = 0;
  //     } else {
  //       _selectedValue[i] = 0.125;
  //     }
  //     _progressValue = 0;
  //     _selectedValue.forEach((e) => _progressValue += e);
  //     if (_progressValue >= 1.0) {
  //       _progressValue = 1.0;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _selectedGrade[0] = context.read<Major>().loadMajorTime('Calculus');
    //   _selectedGrade[1] = context.read<Major>().loadMajorTime('Physics(1)');
    //   _selectedGrade[2] =
    //       context.read<Major>().loadMajorTime('PhysicsExperiment(1)');
    //   _selectedGrade[3] =
    //       context.read<Major>().loadMajorTime('BasicComputerProgramming');
    //   _selectedGrade[4] = context.read<Major>().loadMajorTime('LogicCircuit');
    //   _selectedGrade[5] = context.read<Major>().loadMajorTime('LinearAlgebra');
    //   _selectedGrade[6] =
    //       context.read<Major>().loadMajorTime('DiscreteMathematics');
    //   _selectedGrade[7] = context.read<Major>().loadMajorTime('Programming');
    //   for (int i = 0; i < 8; i++) {
    //     if (_selectedGrade[i] != '0-0') {
    //       _selectedValue[i] = 0.125;
    //       _progressValue += _selectedValue[i];
    //     }
    //   }
    // });

    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture =
        getSubjectsSemester(db, auth, "basicMajor", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadCreditProgress(db, auth, "basicMajor", false);

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
                    currentProgress: context.select((Progress p) => p.requirementsProgress["basicMajor"]!),
                    maxProgress: context.select((Progress p) => p.basicMajorMax),
                    width: 350,
                    height: 30,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Despcription(description: '22학점 중 14학점 이수해야 합니다.', height: 50),
                  const SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: LinearProgressIndicator(
                  //     value: _progressValue,
                  //     minHeight: 35.0,
                  //     color: const Color(0xFFFBBC05),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  // ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('미적분',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "미적분", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "미적분");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  0,
                                  "미적분");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   // firestore 값 넣기 set(SetOptions(merge: true))
                              //   context.read<Major>().changeMajor('Calculus', value!);
                              //   _selectedSemester[0] = value;
                              //   _updateProgress(value, 0);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('일반물리(2)',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "일반물리(2)", 2, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "일반물리(2)");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  1,
                                  "일반물리(2)");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('Physics(1)', value!);
                              //   _selectedSemester[1] = value;
                              //   _updateProgress(value, 1);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('일반물리실험(1)',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "일반물리실험(1)", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "일반물리실험(1)");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  2,
                                  "일반물리실험(1)");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('PhysicsExperiment(1)', value!);
                              //   _selectedSemester[2] = value;
                              //   _updateProgress(value, 2);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('기초컴퓨터프로그래밍',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "기초컴퓨터프로그래밍", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "기초컴퓨터프로그래밍");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  3,
                                  "기초컴퓨터프로그래밍");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('BasicComputerProgramming', value!);
                              //   _selectedSemester[3] = value;
                              //   _updateProgress(value, 3);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('논리회로',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "논리회로", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "논리회로");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  4,
                                  "논리회로");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('LogicCircuit', value!);
                              //   _selectedSemester[4] = value;
                              //   _updateProgress(value, 4);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('선형대수학',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "선형대수학", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "선형대수학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  5,
                                  "선형대수학");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('LinearAlgebra', value!);
                              //   _selectedSemester[5] = value;
                              //   _updateProgress(value, 5);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('이산수학',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
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
                                await setSubject(db, auth, "basicMajor",
                                    "이산수학", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "이산수학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  6,
                                  "이산수학");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DiscreteMathematics', value!);
                              //   _selectedSemester[6] = value;
                              //   _updateProgress(value, 6);
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 270,
                          height: 25,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(13, 4, 0, 0),
                            child: Text('프로그래밍',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[7].toString(),
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
                                await setSubject(db, auth, "basicMajor",
                                    "프로그래밍", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "basicMajor", "프로그래밍");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "basicMajor",
                                  _selectedSemester,
                                  7,
                                  "프로그래밍");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('Programming', value!);
                              //   _selectedSemester[7] = value;
                              //   _updateProgress(value, 7);
                              // });
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
