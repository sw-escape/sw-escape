import 'package:flutter/material.dart';
import 'sideMenu.dart';

class MajorRequired extends StatelessWidget {
  const MajorRequired({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('전공 필수', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: const MajorRequiredPage(),
      endDrawer: SideMenu(),
    );
  }
}

class MajorRequiredPage extends StatefulWidget {
  const MajorRequiredPage({super.key});

  @override
  State<MajorRequiredPage> createState() => _MajorRequiredPageState();
}

class _MajorRequiredPageState extends State<MajorRequiredPage> {
  final _listGrade = ['1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  var _selectedGrade = List<String>.filled(6, '');
  @override
  void initState() {
    super.initState();
    setState(() {
      for(int i = 0; i<6;i++){
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
            Image.asset('assets/MajorRequiredEx.png'),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('자료구조', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      child: Text('컴퓨터구조', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      child: Text('알고리즘', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                      child: Text('운영체제', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
          ],
        ),
      ),
    );
  }
}
