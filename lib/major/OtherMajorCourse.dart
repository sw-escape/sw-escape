import 'package:flutter/material.dart';
import '../sideMenu.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../FirestoreManager.dart';
import '../Progress.dart';
import '../ProgressBar.dart';
import '../widgets.dart';

class OtherMajorCourse extends StatelessWidget {
  const OtherMajorCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '기타 전공과목',
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
      body: const OtherMajorCoursePage(),
      endDrawer: const SideMenu(),
    );
  }
}

class OtherMajorCoursePage extends StatefulWidget {
  const OtherMajorCoursePage({super.key});

  @override
  State<OtherMajorCoursePage> createState() => _OtherMajorCoursePageState();
}

class _OtherMajorCoursePageState extends State<OtherMajorCoursePage> {
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
  final _selectedSemester = List<String>.filled(32, '0-0');
  final _subjectNames = [
    "오픈소스SW와 파이썬 프로그래밍",
    "감성컴퓨팅",
    "컴퓨터시스템및어셈블리언어",
    "오토마타와형식언어",
    "오픈소스SW프로젝트",
    "컴파일러",
    "리눅스시스템응용설계",
    "모바일앱개발",
    "비즈니스 인텔리전스",
    "산업체핸즈온프로젝트",
    "영상처리",
    "컴퓨터그래픽스",
    "컴퓨터통신",
    "코딩부트캠프",
    "휴먼인터페이스미디어",
    "머신러닝",
    "멀티코어컴퓨팅",
    "무선이동통신",
    "자연어처리및정보검색",
    "정보보호이론",
    "정보와지식",
    "컴퓨터비전",
    "패턴인식",
    "가상증강 혼합 현실",
    "로봇비전프로젝트",
    "머신러닝프로젝트",
    "빅데이터",
    "설계 패턴",
    "융합 IoT 프로젝트 설계",
    "컴퓨터게임설계",
    "패턴인식응용",
    "인턴쉽",
  ];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _selectedSemester[0] =
    //       context.read<Major>().loadMajorTime('OpenSourceSWAndPython');
    //   _selectedSemester[1] =
    //       context.read<Major>().loadMajorTime('AffectiveComputing');
    //   _selectedSemester[2] =
    //       context.read<Major>().loadMajorTime('ComputerSystemAndAssemblyLang');
    //   _selectedSemester[3] =
    //       context.read<Major>().loadMajorTime('AutomataAndFormalLanguage');
    //   _selectedSemester[4] =
    //       context.read<Major>().loadMajorTime('OpenSourceSWProject');
    //   _selectedSemester[5] = context.read<Major>().loadMajorTime('Compiler');
    //   _selectedSemester[6] =
    //       context.read<Major>().loadMajorTime('LinuxSystemApplication');
    //   _selectedSemester[7] =
    //       context.read<Major>().loadMajorTime('AppDevelopmentForMobile');
    //   _selectedSemester[8] =
    //       context.read<Major>().loadMajorTime('BusinessIntelligence');
    //   _selectedSemester[9] =
    //       context.read<Major>().loadMajorTime('IndustryHandsOnPj');
    //   _selectedSemester[10] =
    //       context.read<Major>().loadMajorTime('ImageProgressing');
    //   _selectedSemester[11] =
    //       context.read<Major>().loadMajorTime('ComputerGraphics');
    //   _selectedSemester[12] =
    //       context.read<Major>().loadMajorTime('ComputerCommunication');
    //   _selectedSemester[13] =
    //       context.read<Major>().loadMajorTime('CodingBootCamp');
    //   _selectedSemester[14] =
    //       context.read<Major>().loadMajorTime('HumanInterfaceMedia');
    //   _selectedSemester[15] =
    //       context.read<Major>().loadMajorTime('MachineLearning');
    //   _selectedSemester[16] =
    //       context.read<Major>().loadMajorTime('MulticoreComputing');
    //   _selectedSemester[17] =
    //       context.read<Major>().loadMajorTime('WirelessMobileCommunication');
    //   _selectedSemester[18] =
    //       context.read<Major>().loadMajorTime('NatLangProcInfoRetrieval');
    //   _selectedSemester[19] =
    //       context.read<Major>().loadMajorTime('InformationAndSecurityTheory');
    //   _selectedSemester[20] =
    //       context.read<Major>().loadMajorTime('InformationAndKnowledge');
    //   _selectedSemester[21] =
    //       context.read<Major>().loadMajorTime('ComputerVision');
    //   _selectedSemester[22] =
    //       context.read<Major>().loadMajorTime('IntroPatternRecognition');
    //   _selectedSemester[23] =
    //       context.read<Major>().loadMajorTime('VRAugmentedMixedReality');
    //   _selectedSemester[24] =
    //       context.read<Major>().loadMajorTime('MachineVisionPj');
    //   _selectedSemester[25] =
    //       context.read<Major>().loadMajorTime('MachineLearningPj');
    //   _selectedSemester[26] = context.read<Major>().loadMajorTime('BigData');
    //   _selectedSemester[27] = context.read<Major>().loadMajorTime('DesignPattern');
    //   _selectedSemester[28] =
    //       context.read<Major>().loadMajorTime('ConvergentIoTPjDesign');
    //   _selectedSemester[29] =
    //       context.read<Major>().loadMajorTime('DesignOfGameSW');
    //   _selectedSemester[30] =
    //       context.read<Major>().loadMajorTime('AppToPatternRecognition');
    //   _selectedSemester[31] = context.read<Major>().loadMajorTime('Internship');
    // });

    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture = getSubjectsSemester(
        db, auth, "etcMajor", _selectedSemester, _subjectNames);
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context
        .read<Progress>()
        .loadCreditProgress(db, auth, "etcMajor", false);

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
                    currentProgress: context.select((Progress p) => p.requirementsProgress["etcMajor"]!),
                    maxProgress: context.select((Progress p) => p.etcMajorMax),
                    width: 350,
                    height: 30,
                    color: Colors.purpleAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Description(description: '이외 나머지 전공 과목', height: 55),
                  const SizedBox(
                    height: 30,
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('오픈소스SW와 파이썬 프로그래밍',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "오픈소스SW와 파이썬 프로그래밍", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "오픈소스SW와 파이썬 프로그래밍");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 0, "오픈소스SW와 파이썬 프로그래밍");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('OpenSourceSWAndPython', value!);
                              //   _selectedSemester[0] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('감성컴퓨팅',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "감성컴퓨팅", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "감성컴퓨팅");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 1, "감성컴퓨팅");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('AffectiveComputing', value!);
                              //   _selectedSemester[1] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴퓨터시스템및어셈블리언어',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴퓨터시스템및어셈블리언어", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴퓨터시스템및어셈블리언어");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 2, "컴퓨터시스템및어셈블리언어");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor(
                              //       'ComputerSystemAndAssemblyLang', value!);
                              //   _selectedSemester[2] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('오토마타와형식언어',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "오토마타와형식언어", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "오토마타와형식언어");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 3, "오토마타와형식언어");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('AutomataAndFormalLanguage', value!);
                              //   _selectedSemester[3] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('오픈소스SW프로젝트',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "오픈소스SW프로젝트", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "오픈소스SW프로젝트");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 4, "오픈소스SW프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('OpenSourceSWProject', value!);
                              //   _selectedSemester[4] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴파일러',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴파일러", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴파일러");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 5, "컴파일러");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor('Compiler', value!);
                              //   _selectedSemester[5] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('리눅스시스템응용설계',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "리눅스시스템응용설계", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "리눅스시스템응용설계");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 6, "리눅스시스템응용설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('LinuxSystemApplication', value!);
                              //   _selectedSemester[6] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('모바일앱개발',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "모바일앱개발", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "모바일앱개발");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 7, "모바일앱개발");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('AppDevelopmentForMobile', value!);
                              //   _selectedSemester[7] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('비즈니스 인텔리전스',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "비즈니스 인텔리전스", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "비즈니스 인텔리전스");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 8, "비즈니스 인텔리전스");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('BusinessIntelligence', value!);
                              //   _selectedSemester[8] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('산업체핸즈온프로젝트',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "산업체핸즈온프로젝트", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "산업체핸즈온프로젝트");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 9, "산업체핸즈온프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('IndustryHandsOnPj', value!);
                              //   _selectedSemester[9] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('영상처리',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "영상처리", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "영상처리");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 10, "영상처리");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ImageProgressing', value!);
                              //   _selectedSemester[10] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴퓨터그래픽스',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴퓨터그래픽스", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴퓨터그래픽스");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 11, "컴퓨터그래픽스");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ComputerGraphics', value!);
                              //   _selectedSemester[11] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴퓨터통신',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴퓨터통신", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴퓨터통신");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 12, "컴퓨터통신");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ComputerCommunication', value!);
                              //   _selectedSemester[12] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('코딩부트캠프',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "코딩부트캠프", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "코딩부트캠프");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 13, "코딩부트캠프");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('CodingBootCamp', value!);
                              //   _selectedSemester[13] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('휴먼인터페이스미디어',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                                await setSubject(
                                    db, auth, "etcMajor", "휴먼인터페이스미디어", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "휴먼인터페이스미디어");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 14, "휴먼인터페이스미디어");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('HumanInterfaceMedia', value!);
                              //   _selectedSemester[14] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('머신러닝',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[15].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "머신러닝", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "머신러닝");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 15, "머신러닝");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('MachineLearning', value!);
                              //   _selectedSemester[15] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('멀티코어컴퓨팅',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[16].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "멀티코어컴퓨팅", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "멀티코어컴퓨팅");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 16, "멀티코어컴퓨팅");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('MulticoreComputing', value!);
                              //   _selectedSemester[16] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('무선이동통신',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[17].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "무선이동통신", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "무선이동통신");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 17, "무선이동통신");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor(
                              //       'WirelessMobileCommunication', value!);
                              //   _selectedSemester[17] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('자연어처리및정보검색',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[18].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "자연어처리및정보검색", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "자연어처리및정보검색");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 18, "자연어처리및정보검색");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('NatLangProcInfoRetrieval', value!);
                              //   _selectedSemester[18] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('정보보호이론',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[19].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "정보보호이론", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "정보보호이론");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 19, "정보보호이론");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor(
                              //       'InformationAndSecurityTheory', value!);
                              //   _selectedSemester[19] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('정보와지식',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[20].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "정보와지식", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "정보와지식");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 20, "정보와지식");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('InformationAndKnowledge', value!);
                              //   _selectedSemester[20] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴퓨터비전',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[21].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴퓨터비전", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴퓨터비전");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 21, "컴퓨터비전");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ComputerVision', value!);
                              //   _selectedSemester[21] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('패턴인식',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[22].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "패턴인식", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "패턴인식");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 22, "패턴인식");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('IntroPatternRecognition', value!);
                              //   _selectedSemester[22] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('가상증강 혼합 현실',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[23].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "가상증강 혼합 현실", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "가상증강 혼합 현실");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 23, "가상증강 혼합 현실");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('VRAugmentedMixedReality', value!);
                              //   _selectedSemester[23] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('로봇비전프로젝트',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[24].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "로봇비전프로젝트", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "로봇비전프로젝트");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 24, "로봇비전프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('MachineVisionPj', value!);
                              //   _selectedSemester[24] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('머신러닝프로젝트',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[25].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "머신러닝프로젝트", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "머신러닝프로젝트");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 25, "머신러닝프로젝트");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('MachineLearningPj', value!);
                              //   _selectedSemester[25] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('빅데이터',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[26].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "빅데이터", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "빅데이터");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 26, "빅데이터");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context.read<Major>().changeMajor('BigData', value!);
                              //   _selectedSemester[26] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('설계 패턴',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[27].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "설계 패턴", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "설계 패턴");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 27, "설계 패턴");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DesignPattern', value!);
                              //   _selectedSemester[27] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('융합 IoT 프로젝트 설계',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[28].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "융합 IoT 프로젝트 설계", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "융합 IoT 프로젝트 설계");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 28, "융합 IoT 프로젝트 설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('ConvergentIoTPjDesign', value!);
                              //   _selectedSemester[28] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('컴퓨터게임설계',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[29].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "컴퓨터게임설계", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "컴퓨터게임설계");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 29, "컴퓨터게임설계");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('DesignOfGameSW', value!);
                              //   _selectedSemester[29] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('패턴인식응용',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[30].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "패턴인식응용", 3, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "패턴인식응용");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 30, "패턴인식응용");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('AppToPatternRecognition', value!);
                              //   _selectedSemester[30] = value;
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
                            padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                            child: Text('인턴쉽',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
                            value: _selectedSemester[31].toString(),
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
                                await setSubject(
                                    db, auth, "etcMajor", "인턴쉽", 15, semester!);
                              } else {
                                await deleteSubject(db, auth, "etcMajor", "인턴쉽");
                              }
                              await getSubjectSemester(db, auth, "etcMajor",
                                  _selectedSemester, 31, "인턴쉽");
                              setState(() {
                                // 리빌드
                              });
                              // setState(() {
                              //   context
                              //       .read<Major>()
                              //       .changeMajor('Internship', value!);
                              //   _selectedSemester[31] = value;
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
