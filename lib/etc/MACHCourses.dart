import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../FirestoreManager.dart';
import '../Progress.dart';
import 'package:provider/provider.dart';

class MACHCourseDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MACHCourseDialogState();
  }
}

class _MACHCourseDialogState extends State<MACHCourseDialog> {
  final _listSemester = ['0-0','1-1', '1-2', '2-1', '2-2', '3-1', '3-2', '4-1', '4-2', '5-1', '5-2', '6-1', '6-2'];
  final _selectedSemester = List<String>.filled(4, '0-0');
  final _subjectNames = ["마하1", "마하2", "마하3", "마하4"];
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late Future<void> _getSubjectsSemesterFuture;

  @override
  void initState() {
    super.initState();
    // firestore에서 과목들의 '학기' 정보 가져오기
    _getSubjectsSemesterFuture =
        getSubjectsSemester(db, auth, "machCourseDialog", _selectedSemester, _subjectNames);
  }
  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "machCourseDialog");

    return FutureBuilder(
      future: _getSubjectsSemesterFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return AlertDialog(
            content: Container(
              height: 500,
              //constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[Color(0xFF507BEC),Color(0xFFADC9FF)]
                  )
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/MACHCourseEx.png'),
                  const SizedBox(
                    height: 60,
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
                            child: Text('마하', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[0].toString(),
                            items: _listSemester.map(
                                  (semester)=>DropdownMenuItem(
                                  value: semester,
                                  child: (semester == '0-0') ? const Text('학기', style: TextStyle(fontWeight: FontWeight.bold)) : Text(semester, style: const TextStyle(fontWeight: FontWeight.bold))
                              ),
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                    db,
                                    auth,
                                    "machCourseDialog",
                                    "마하1",
                                    0,
                                    semester!
                                );
                              } else {
                                await deleteSubject(
                                    db,
                                    auth,
                                    "machCourseDialog",
                                    "마하1"
                                );
                              }
                              await getSubjectSemester(
                                  db,
                                  auth,
                                  "machCourseDialog",
                                  _selectedSemester,
                                  0,
                                  "마하1");
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
                            child: Text('마하', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[1].toString(),
                            items: _listSemester.map(
                                  (semester)=>DropdownMenuItem(
                                  value: semester,
                                  child: (semester == '0-0') ? const Text('학기', style: TextStyle(fontWeight: FontWeight.bold)) : Text(semester, style: const TextStyle(fontWeight: FontWeight.bold))
                              ),
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하2",
                                0,
                                semester!
                                );
                              } else {
                                await deleteSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하2"
                                );
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "machCourseDialog",
                              _selectedSemester,
                              1,
                              "마하2");
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
                            child: Text('마하', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[2].toString(),
                            items: _listSemester.map(
                                  (semester)=>DropdownMenuItem(
                                  value: semester,
                                  child: (semester == '0-0') ? const Text('학기', style: TextStyle(fontWeight: FontWeight.bold)) : Text(semester, style: const TextStyle(fontWeight: FontWeight.bold))
                              ),
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하3",
                                0,
                                semester!
                                );
                              } else {
                                await deleteSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하3"
                                );
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "machCourseDialog",
                              _selectedSemester,
                              2,
                              "마하3");
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
                            child: Text('마하', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: DropdownButton(
                            value: _selectedSemester[3].toString(),
                            items: _listSemester.map(
                                  (semester)=>DropdownMenuItem(
                                  value: semester,
                                  child: (semester == '0-0') ? const Text('학기', style: TextStyle(fontWeight: FontWeight.bold)) : Text(semester, style: const TextStyle(fontWeight: FontWeight.bold))
                              ),
                            ).toList(),
                            onChanged: (semester) async {
                              if (semester != '0-0') {
                                await setSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하4",
                                0,
                                semester!
                                );
                              } else {
                                await deleteSubject(
                                db,
                                auth,
                                "machCourseDialog",
                                "마하4"
                                );
                              }
                              await getSubjectSemester(
                              db,
                              auth,
                              "machCourseDialog",
                              _selectedSemester,
                              3,
                              "마하4");
                              setState(() {
                                // 리빌드
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              width: 1,
                              color: Colors.black
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: Text('Enter', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black45.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(1.0,1.0),
                              )
                            ]
                        ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.all(0.0),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
