import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'sideMenu.dart';

class DesignSubject extends StatelessWidget {
  const DesignSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('설계 과목', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
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
  final _listGrade = ['1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  var _selectedGrade = List<String>.filled(15, '');
  @override
  void initState() {
    super.initState();
    setState(() {
      for(int i = 0; i<15;i++){
        _selectedGrade[i] = _listGrade[0];
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[Color(0xFF54A9F6),Color(0xFF93CBFF)]
          )
      ),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 35.0,
                animationDuration: 2500,
                percent: 0.8,
                progressColor: const Color(0xFFFB7A7A),
                barRadius: const Radius.circular(20),
              ),
            ),
            Image.asset('assets/설계 설명.png'),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('창의적설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[0].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[0] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('캡스톤디자인(1)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[1].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[1] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('캡스톤디자인(2)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[2].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[2] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('논리회로', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[3].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[3] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('프로그래밍', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[4].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[4] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('소프트웨어프로젝트', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[5].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[5] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('객체지향프로그래밍', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[6].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[6] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('프로그래밍언어론', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[7].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[7] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('데이터베이스설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[8].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[8] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('소프트웨어공학', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[9].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[9] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('인공지능', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[10].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[10] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('고급 IoT 프로젝트', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[11].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[11] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('데이터베이스시스템', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[12].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[12] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('네트워크응용설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[13].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[13] = value!;
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('내장형시스템설계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                trailing: Container(
                  height: 36,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: _selectedGrade[14].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: Text(grade, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedGrade[14] = value!;
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