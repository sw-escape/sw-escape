import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Major.dart';
import 'sideMenu.dart';

class BSM extends StatelessWidget {
  const BSM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('BSM', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/Menu.png')
            ),
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
  final _listGrade = ['0-0','1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  var _selectedGrade = List<String>.filled(7, '');
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedGrade[0] = context.read<Major>().loadMajorTime('Physics(1)');
      _selectedGrade[1] = context.read<Major>().loadMajorTime('PhysicsExperiment(1)');
      _selectedGrade[2] = context.read<Major>().loadMajorTime('Calculus');
      _selectedGrade[3] = context.read<Major>().loadMajorTime('LinearAlgebra');
      _selectedGrade[4] = context.read<Major>().loadMajorTime('DiscreteMathematics');
      _selectedGrade[5] = context.read<Major>().loadMajorTime('ProbabilityAndStatistics');
      _selectedGrade[6] = context.read<Major>().loadMajorTime('NumericalAnalysis');
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
                      child: Text('일반물리(1)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('Physics(1)', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text('일반물리실험(1)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('PhysicsExperiment(1)', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text('미적분학', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('Calculus', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text('선형대수학', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('LinearAlgebra', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
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
                      value: _selectedGrade[4].toString(),
                      items: _listGrade.map(
                            (grade)=>DropdownMenuItem(
                            value: grade,
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('DiscreteMathematics', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text('확률 및 통계', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('ProbabilityAndStatistics', value!);
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
                      padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text('수치해석', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                            child: (grade == '0-0') ? const Text('학기',style: TextStyle(fontWeight: FontWeight.bold)) : Text(grade, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ).toList(),
                      onChanged: (value){
                        setState(() {
                          context.read<Major>().changeMajor('NumericalAnalysis', value!);
                          _selectedGrade[6] = value!;
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