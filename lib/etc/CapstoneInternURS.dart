import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sw_escape/FirestoreManager.dart';
import '../Progress.dart';
import 'package:provider/provider.dart';

class CapInternURSDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CapInternURSDialogState();
  }
}

class _CapInternURSDialogState extends State<CapInternURSDialog> {
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> checkExistedData() async {
    _isChecked1 = await isExisted(db, auth, "capstone", "인턴");
    _isChecked2 = await isExisted(db, auth, "capstone", "학부연구생");
    _isChecked1 ??= false;
    _isChecked2 ??= false;
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "capstone");

    return FutureBuilder(
      future: checkExistedData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return AlertDialog(
            content: Container(
              height: 500,
              //constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF507BEC), Color(0xFFADC9FF)])),
              child: Column(
                children: [
                  Image.asset('assets/images/CapInternURSEx.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 5.0,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text(
                                '인턴',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black45.withOpacity(0.5),
                                      blurRadius: 3,
                                      offset: const Offset(1.0, 1.0),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  focusColor: Colors.black,
                                  value: _isChecked1,
                                  onChanged: (value) async {
                                    // 체크하는 경우
                                    if(value == true){
                                      await setSubject(db, auth, "capstone", "인턴", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(db, auth, "capstone", "인턴");
                                    }
                                    setState(() {
                                      // 리빌드
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 5.0,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text(
                                '학부연구생',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black45.withOpacity(0.5),
                                      blurRadius: 3,
                                      offset: const Offset(1.0, 1.0),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  focusColor: Colors.black,
                                  value: _isChecked2,
                                  onChanged: (value) async {
                                    // 체크하는 경우
                                    if(value == true){
                                      await setSubject(db, auth, "capstone", "학부연구생", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(db, auth, "capstone", "학부연구생");
                                    }
                                    setState(() {
                                      // 리빌드
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0174B7),
                      maximumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black45,
                    ),
                    onPressed: () async {
                      final url = Uri.parse('https://placement.cau.ac.kr/');
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      }
                    },
                    child: Transform.scale(
                        scale: 0.9,
                        child: Image.asset('assets/images/Placement.png')),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      maximumSize: const Size.fromHeight(43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black45,
                    ),
                    onPressed: () async {
                      final url = Uri.parse('http://ictintern.or.kr/');
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      }
                    },
                    child: Image.asset('assets/images/IctInternship.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: Text(
                          'Enter',
                          style: TextStyle(fontWeight: FontWeight.bold, shadows: [
                            Shadow(
                              color: Colors.black45.withOpacity(0.5),
                              blurRadius: 3,
                              offset: const Offset(1.0, 1.0),
                            )
                          ]),
                        )),
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.all(0.0),
          );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
