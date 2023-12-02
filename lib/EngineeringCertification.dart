import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'package:provider/provider.dart';
import 'student.dart';

class EngineeringCertification extends StatelessWidget {
  const EngineeringCertification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('공학인증 필수과목', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: const EngineeringCertificationPage(),
      endDrawer: SideMenu(),
    );
  }
}

class EngineeringCertificationPage extends StatefulWidget {
  const EngineeringCertificationPage({super.key});

  @override
  State<EngineeringCertificationPage> createState() => _EngineeringCertificationPageState();
}

class _EngineeringCertificationPageState extends State<EngineeringCertificationPage> {
  final _listGrade = ['0-0','1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  var _selectedGrade = List<String>.filled(5, '');
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedGrade[0] = context.read<Major>().loadMajorTime('DiscreteMathematics');
      _selectedGrade[1] = context.read<Major>().loadMajorTime('DataStructure');
      _selectedGrade[2] = context.read<Major>().loadMajorTime('ComputerArchitecture');
      _selectedGrade[3] = context.read<Major>().loadMajorTime('Algorithm');
      _selectedGrade[4] = context.read<Major>().loadMajorTime('OperatingSystem');
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
            Image.asset('assets/images/ECEx.png'),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('이산수학', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            (point)=>DropdownMenuItem(
                            value: point,
                            child: Text(point, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DiscreteMathematics', value!);
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
                      value: _selectedGrade[1].toString(),
                      items: _listGrade.map(
                            (point)=>DropdownMenuItem(
                            value: point,
                            child: Text(point, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DataStructure', value!);
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
                      value: _selectedGrade[2].toString(),
                      items: _listGrade.map(
                            (point)=>DropdownMenuItem(
                            value: point,
                            child: Text(point, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('ComputerArchitecture', value!);
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
                      value: _selectedGrade[3].toString(),
                      items: _listGrade.map(
                            (point)=>DropdownMenuItem(
                            value: point,
                            child: Text(point, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('Algorithm', value!);
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
                      value: _selectedGrade[4].toString(),
                      items: _listGrade.map(
                            (point)=>DropdownMenuItem(
                            value: point,
                            child: Text(point, style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('OperatingSystem', value!);
                          _selectedGrade[4] = value;
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