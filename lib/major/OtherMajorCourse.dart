import 'package:flutter/material.dart';
import '../sideMenu.dart';
import '../Major.dart';
import 'package:provider/provider.dart';

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
  final _listGrade = [
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
  var _selectedGrade = List<String>.filled(32, '');
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedGrade[0] =
          context.read<Major>().loadMajorTime('OpenSourceSWAndPython');
      _selectedGrade[1] =
          context.read<Major>().loadMajorTime('AffectiveComputing');
      _selectedGrade[2] =
          context.read<Major>().loadMajorTime('ComputerSystemAndAssemblyLang');
      _selectedGrade[3] =
          context.read<Major>().loadMajorTime('AutomataAndFormalLanguage');
      _selectedGrade[4] =
          context.read<Major>().loadMajorTime('OpenSourceSWProject');
      _selectedGrade[5] = context.read<Major>().loadMajorTime('Compiler');
      _selectedGrade[6] =
          context.read<Major>().loadMajorTime('LinuxSystemApplication');
      _selectedGrade[7] =
          context.read<Major>().loadMajorTime('AppDevelopmentForMobile');
      _selectedGrade[8] =
          context.read<Major>().loadMajorTime('BusinessIntelligence');
      _selectedGrade[9] =
          context.read<Major>().loadMajorTime('IndustryHandsOnPj');
      _selectedGrade[10] =
          context.read<Major>().loadMajorTime('ImageProgressing');
      _selectedGrade[11] =
          context.read<Major>().loadMajorTime('ComputerGraphics');
      _selectedGrade[12] =
          context.read<Major>().loadMajorTime('ComputerCommunication');
      _selectedGrade[13] =
          context.read<Major>().loadMajorTime('CodingBootCamp');
      _selectedGrade[14] =
          context.read<Major>().loadMajorTime('HumanInterfaceMedia');
      _selectedGrade[15] =
          context.read<Major>().loadMajorTime('MachineLearning');
      _selectedGrade[16] =
          context.read<Major>().loadMajorTime('MulticoreComputing');
      _selectedGrade[17] =
          context.read<Major>().loadMajorTime('WirelessMobileCommunication');
      _selectedGrade[18] =
          context.read<Major>().loadMajorTime('NatLangProcInfoRetrieval');
      _selectedGrade[19] =
          context.read<Major>().loadMajorTime('InformationAndSecurityTheory');
      _selectedGrade[20] =
          context.read<Major>().loadMajorTime('InformationAndKnowledge');
      _selectedGrade[21] =
          context.read<Major>().loadMajorTime('ComputerVision');
      _selectedGrade[22] =
          context.read<Major>().loadMajorTime('IntroPatternRecognition');
      _selectedGrade[23] =
          context.read<Major>().loadMajorTime('VRAugmentedMixedReality');
      _selectedGrade[24] =
          context.read<Major>().loadMajorTime('MachineVisionPj');
      _selectedGrade[25] =
          context.read<Major>().loadMajorTime('MachineLearningPj');
      _selectedGrade[26] = context.read<Major>().loadMajorTime('BigData');
      _selectedGrade[27] = context.read<Major>().loadMajorTime('DesignPattern');
      _selectedGrade[28] =
          context.read<Major>().loadMajorTime('ConvergentIoTPjDesign');
      _selectedGrade[29] =
          context.read<Major>().loadMajorTime('DesignOfGameSW');
      _selectedGrade[30] =
          context.read<Major>().loadMajorTime('AppToPatternRecognition');
      _selectedGrade[31] = context.read<Major>().loadMajorTime('Internship');
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Description(description: '이외 나머지 전공 과목', height: 55),
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
                      value: _selectedGrade[0].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('OpenSourceSWAndPython', value!);
                          _selectedGrade[0] = value;
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
                      value: _selectedGrade[1].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('AffectiveComputing', value!);
                          _selectedGrade[1] = value;
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
                      value: _selectedGrade[2].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context.read<Major>().changeMajor(
                              'ComputerSystemAndAssemblyLang', value!);
                          _selectedGrade[2] = value;
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
                      value: _selectedGrade[3].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('AutomataAndFormalLanguage', value!);
                          _selectedGrade[3] = value;
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
                      value: _selectedGrade[4].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('OpenSourceSWProject', value!);
                          _selectedGrade[4] = value;
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
                      value: _selectedGrade[5].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context.read<Major>().changeMajor('Compiler', value!);
                          _selectedGrade[5] = value;
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
                      value: _selectedGrade[6].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('LinuxSystemApplication', value!);
                          _selectedGrade[6] = value;
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
                      value: _selectedGrade[7].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('AppDevelopmentForMobile', value!);
                          _selectedGrade[7] = value;
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
                      value: _selectedGrade[8].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('BusinessIntelligence', value!);
                          _selectedGrade[8] = value;
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
                      value: _selectedGrade[9].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('IndustryHandsOnPj', value!);
                          _selectedGrade[9] = value;
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
                      value: _selectedGrade[10].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('ImageProgressing', value!);
                          _selectedGrade[10] = value;
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
                      value: _selectedGrade[11].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('ComputerGraphics', value!);
                          _selectedGrade[11] = value;
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
                      value: _selectedGrade[12].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('ComputerCommunication', value!);
                          _selectedGrade[12] = value;
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
                      value: _selectedGrade[13].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('CodingBootCamp', value!);
                          _selectedGrade[13] = value;
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
                      value: _selectedGrade[14].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('HumanInterfaceMedia', value!);
                          _selectedGrade[14] = value;
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
                      value: _selectedGrade[15].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('MachineLearning', value!);
                          _selectedGrade[15] = value;
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
                      value: _selectedGrade[16].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('MulticoreComputing', value!);
                          _selectedGrade[16] = value;
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
                      value: _selectedGrade[17].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context.read<Major>().changeMajor(
                              'WirelessMobileCommunication', value!);
                          _selectedGrade[17] = value;
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
                      value: _selectedGrade[18].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('NatLangProcInfoRetrieval', value!);
                          _selectedGrade[18] = value;
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
                      value: _selectedGrade[19].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context.read<Major>().changeMajor(
                              'InformationAndSecurityTheory', value!);
                          _selectedGrade[19] = value;
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
                      value: _selectedGrade[20].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('InformationAndKnowledge', value!);
                          _selectedGrade[20] = value;
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
                      value: _selectedGrade[21].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('ComputerVision', value!);
                          _selectedGrade[21] = value;
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
                      value: _selectedGrade[22].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('IntroPatternRecognition', value!);
                          _selectedGrade[22] = value;
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
                      value: _selectedGrade[23].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('VRAugmentedMixedReality', value!);
                          _selectedGrade[23] = value;
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
                      value: _selectedGrade[24].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('MachineVisionPj', value!);
                          _selectedGrade[24] = value;
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
                      value: _selectedGrade[25].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('MachineLearningPj', value!);
                          _selectedGrade[25] = value;
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
                      value: _selectedGrade[26].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context.read<Major>().changeMajor('BigData', value!);
                          _selectedGrade[26] = value;
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
                      value: _selectedGrade[27].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('DesignPattern', value!);
                          _selectedGrade[27] = value;
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
                      value: _selectedGrade[28].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('ConvergentIoTPjDesign', value!);
                          _selectedGrade[28] = value;
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
                      value: _selectedGrade[29].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('DesignOfGameSW', value!);
                          _selectedGrade[29] = value;
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
                      value: _selectedGrade[30].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('AppToPatternRecognition', value!);
                          _selectedGrade[30] = value;
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
                      value: _selectedGrade[31].toString(),
                      items: _listGrade
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
                      onChanged: (value) {
                        setState(() {
                          context
                              .read<Major>()
                              .changeMajor('Internship', value!);
                          _selectedGrade[31] = value;
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
  }
}
