import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Major.dart';
import '../sideMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Progress.dart';
import '../ProgressBar.dart';
import '../FirestoreManager.dart';

class DesignSubject extends StatelessWidget {
  const DesignSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '설계 과목',
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
      body: const DesignSubjectPage(),
      endDrawer: SideMenu(),
    );
  }
}

class DesignSubjectPage extends StatefulWidget {
  const DesignSubjectPage({super.key});

  @override
  State<DesignSubjectPage> createState() => _DesignSubjectPageState();
}

class _DesignSubjectPageState extends State<DesignSubjectPage> {
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
  final _selectedSemester = List<String>.filled(15, '0-0');
  final _subjectNames = [
    "창의적설계",
    "캡스톤디자인(1)",
    "캡스톤디자인(2)",
    "논리회로",
    "프로그래밍",
    "소프트웨어프로젝트",
    "객체지향프로그래밍",
    "프로그래밍언어론",
    "데이터베이스설계",
    "소프트웨어공학",
    "인공지능",
    "고급IoT프로젝트",
    "데이터베이스시스템",
    "네트워크응용설계",
    "내장형시스템설계",
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  // final _selectedValue = List<double>.filled(15, 0.0);
  // double _progressValue = 0;
  // void _updateProgress(String value, int i) {
  //   setState(() {
  //     if (value == '0-0') {
  //       _selectedValue[i] = 0;
  //     } else {
  //       _selectedValue[i] = 0.0667;
  //     }
  //     _progressValue = 0;
  //     if (_selectedValue[0] != '0-0') {
  //       for (int j = 0; j < 15; j++) {
  //         _progressValue += _selectedValue[j];
  //       }
  //     }
  //     if (_progressValue >= 1.0) {
  //       _progressValue = 1.0;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _selectedSemester[0] = context.read<Major>().loadMajorTime('CreativeDesign');
    //   _selectedSemester[1] =
    //       context.read<Major>().loadMajorTime('CapstoneDesign(1)');
    //   _selectedSemester[2] =
    //       context.read<Major>().loadMajorTime('CapstoneDesign(2)');
    //   _selectedSemester[3] = context.read<Major>().loadMajorTime('LogicCircuit');
    //   _selectedSemester[4] = context.read<Major>().loadMajorTime('Programming');
    //   _selectedSemester[5] =
    //       context.read<Major>().loadMajorTime('SoftwareProject');
    //   _selectedSemester[6] =
    //       context.read<Major>().loadMajorTime('ObjectOrientedProgramming');
    //   _selectedSemester[7] = context
    //       .read<Major>()
    //       .loadMajorTime('PrinciplesOfProgrammingLanguage');
    //   _selectedSemester[8] = context.read<Major>().loadMajorTime('DatabaseDesign');
    //   _selectedSemester[9] =
    //       context.read<Major>().loadMajorTime('SoftwareEngineering');
    //   _selectedSemester[10] =
    //       context.read<Major>().loadMajorTime('ArtificialIntelligence');
    //   _selectedSemester[11] =
    //       context.read<Major>().loadMajorTime('AdvancedIoTProject');
    //   _selectedSemester[12] =
    //       context.read<Major>().loadMajorTime('DatabaseSystem');
    //   _selectedSemester[13] =
    //       context.read<Major>().loadMajorTime('NetworkApplicationAndDesign');
    //   _selectedSemester[14] =
    //       context.read<Major>().loadMajorTime('DesignOfEmbeddedSystem');
    //   for (int i = 0; i < 15; i++) {
    //     if (_selectedSemester[i] != '0-0') {
    //       _selectedValue[i] = 0.0667;
    //       _progressValue += _selectedValue[i];
    //     }
    //   }
    // });

    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture = getSubjectsSemester(db, auth, "designSubject", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadCreditProgress(db, auth, "designSubject");

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
                  // Padding(
                  //   padding: const EdgeInsets.all(16),
                  //   child: LinearProgressIndicator(
                  //     value: _progressValue,
                  //     minHeight: 35.0,
                  //     color: const Color(0xFFFB7A7A),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProgressBar(
                    currentProgress: context.select((Progress p) => p.requirementsProgress["designSubject"]!),
                    maxProgress: context.select((Progress p) => p.designSubjectMax),
                    width: 350,
                    height: 30,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/DesignSubjectEx.png'),
                  const SizedBox(
                    height: 50,
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
                            child: Text('창의적설계',
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
                                await setSubject(db, auth, "designSubject",
                                    "창의적설계", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "창의적설계");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  0,
                                  "창의적설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('CreativeDesign', semester!);
                              //   _selectedSemester[0] = semester;
                              //   _updateProgress(semester, 0);
                              // });
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
                            child: Text('캡스톤디자인(1)',
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
                                await setSubject(db, auth, "designSubject",
                                    "캡스톤디자인(1)", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "캡스톤디자인(1)");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  1,
                                  "캡스톤디자인(1)");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('CapstoneDesign(1)', value!);
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
                            child: Text('캡스톤디자인(2)',
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
                                await setSubject(db, auth, "designSubject",
                                    "캡스톤디자인(2)", 3, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "캡스톤디자인(2)");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  2,
                                  "캡스톤디자인(2)");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('CapstoneDesign(2)', value!);
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
                            child: Text('논리회로',
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
                                await setSubject(db, auth, "designSubject",
                                    "논리회로", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "논리회로");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  3,
                                  "논리회로");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('LogicCircuit', value!);
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
                            child: Text('프로그래밍',
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
                                await setSubject(db, auth, "designSubject",
                                    "프로그래밍", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "프로그래밍");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  4,
                                  "프로그래밍");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('Programming', value!);
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
                            child: Text('소프트웨어프로젝트',
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
                                await setSubject(db, auth, "designSubject",
                                    "소프트웨어프로젝트", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "소프트웨어프로젝트");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  5,
                                  "소프트웨어프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('SoftwareProject', value!);
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
                            child: Text('객체지향프로그래밍',
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
                                await setSubject(db, auth, "designSubject",
                                    "객체지향프로그래밍", 2, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "객체지향프로그래밍");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  6,
                                  "객체지향프로그래밍");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ObjectOrientedProgramming', value!);
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
                                await setSubject(db, auth, "designSubject",
                                    "프로그래밍언어론", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "프로그래밍언어론");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  7,
                                  "프로그래밍언어론");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor(
                              //       'PrinciplesOfProgrammingLanguage', value!);
                              //   _selectedSemester[7] = value;
                              //   _updateProgress(value, 7);
                              // });
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
                            child: Text('데이터베이스설계',
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
                            value: _selectedSemester[8].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "데이터베이스설계", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "데이터베이스설계");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  8,
                                  "데이터베이스설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DatabaseDesign', value!);
                              //   _selectedSemester[8] = value;
                              //   _updateProgress(value, 8);
                              // });
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
                            value: _selectedSemester[9].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "소프트웨어공학", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "소프트웨어공학");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  9,
                                  "소프트웨어공학");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('SoftwareEngineering', value!);
                              //   _selectedSemester[9] = value;
                              //   _updateProgress(value, 9);
                              // });
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
                            child: Text('인공지능',
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
                            value: _selectedSemester[10].toString(),
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
                                  await setSubject(db, auth, "designSubject",
                                      "인공지능", 1, semester!);
                                } else {
                                  await deleteSubject(
                                      db, auth, "designSubject", "인공지능");
                                }
                                await getSubjectSemester(
                                    db,
                                    auth,
                                    "designSubject",
                                    _selectedSemester,
                                    10,
                                    "인공지능");
                                setState(() {
                                  // 리빌드
                                });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ArtificialIntelligence', value!);
                              //   _selectedSemester[10] = value;
                              //   _updateProgress(value, 10);
                              // });
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
                            child: Text('고급 IoT 프로젝트',
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
                            value: _selectedSemester[11].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "고급IoT프로젝트", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "고급IoT프로젝트");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  11,
                                  "고급IoT프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('AdvancedIoTProject', value!);
                              //   _selectedSemester[11] = value;
                              //   _updateProgress(value, 11);
                              // });
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
                            child: Text('데이터베이스시스템',
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
                            value: _selectedSemester[12].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "데이터베이스시스템", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "데이터베이스시스템");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  12,
                                  "데이터베이스시스템");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DatabaseSystem', value!);
                              //   _selectedSemester[12] = value;
                              //   _updateProgress(value, 12);
                              // });
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
                            child: Text('네트워크응용설계',
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
                            value: _selectedSemester[13].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "네트워크응용설계", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "네트워크응용설계");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  13,
                                  "네트워크응용설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor(
                              //       'NetworkApplicationAndDesign', value!);
                              //   _selectedSemester[13] = value;
                              //   _updateProgress(value, 13);
                              // });
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
                            child: Text('내장형시스템설계',
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
                            value: _selectedSemester[14].toString(),
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
                                await setSubject(db, auth, "designSubject",
                                    "내장형시스템설계", 1, semester!);
                              } else {
                                await deleteSubject(
                                    db, auth, "designSubject", "내장형시스템설계");
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "designSubject",
                                  _selectedSemester,
                                  14,
                                  "내장형시스템설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DesignOfEmbeddedSystem', value!);
                              //   _selectedSemester[14] = value;
                              //   _updateProgress(value, 14);
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
