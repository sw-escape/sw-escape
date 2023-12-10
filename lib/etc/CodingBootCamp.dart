import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sw_escape/FirestoreManager.dart';
import '../Progress.dart';
import 'package:provider/provider.dart';

class CodingBootCampDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodingBootCampDialogState();
  }
}

class _CodingBootCampDialogState extends State<CodingBootCampDialog> {
  bool? _isCheckedPass = false;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> checkExistedData() async {
    _isCheckedPass = await isExisted(db, auth, "codingBootCampDialog", "코딩부트캠프");
    _isCheckedPass ??= false;
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "codingBootCampDialog");

    return FutureBuilder(
      future: checkExistedData(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
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
                  Image.asset('assets/images/BootCampEx.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 200,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text('Pass', style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black45.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(1.0,1.0),
                              )
                            ],
                          ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Transform.scale(
                            scale: 2.5,
                            child: Checkbox(
                              focusColor: Colors.black,
                              value: _isCheckedPass,
                              onChanged: (value) async {
                                // 체크하는 경우
                                if(value == true){
                                  await setSubject(db, auth, "codingBootCampDialog", "코딩부트캠프", 3, "0-0");
                                }
                                // 체크를 해제하는 경우
                                else {
                                  await deleteSubject(db, auth, "codingBootCampDialog", "코딩부트캠프");
                                }
                                setState(() {
                                  // 리빌드
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)
                              ),
                            ),
                          ),
                        ],
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
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
