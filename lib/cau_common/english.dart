import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sw_escape/widgets.dart';
import '../Progress.dart';
import '../FirestoreManager.dart';

import '../sideMenu.dart';
import 'common_info.dart';

class English extends StatefulWidget {
  const English({super.key});

  @override
  State<English> createState() => _EnglishState();
}

class _EnglishState extends State<English> {
  TextEditingController _textController = TextEditingController();
  bool? isTOEICLevel5OrHigher = false;
  bool? isEngA3rHigher = false;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> checkExistedData() async {
    isTOEICLevel5OrHigher = await isExisted(db, auth, "english", "토익");
    isEngA3rHigher = await isExisted(db, auth, "english", "영어A");
    isTOEICLevel5OrHigher ??= false;
    isEngA3rHigher ??= false;
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "english");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '영어',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: const SideMenu(),
      body: FutureBuilder(
        future: checkExistedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              // color: Colors.blue,
              color: const Color(0xFF72BBFF),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Description(
                          description: '토익 스피킹 5급 이상 혹은 전공 과목 중 영어A 3과목 이상 이수',
                          height: 70),
                      // if (context.read<CommonInfo>().isTOEICLevel5OrHigher == true ||
                      //     context.read<CommonInfo>().isEngA3rHigher == true)
                      SizedBox(
                        height: 20,
                      ),
                      if (isTOEICLevel5OrHigher == true ||
                          isEngA3rHigher == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 1.0,
                            center: Text('100%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            progressColor: Colors.blue,
                          ),
                        ),
                      // if (context.read<CommonInfo>().isTOEICLevel5OrHigher == false &&
                      //     context.read<CommonInfo>().isEngA3rHigher == false)
                      if (isTOEICLevel5OrHigher == false &&
                          isEngA3rHigher == false)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 0.0,
                            center: Text('0%',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue)),
                            backgroundColor: Colors.white.withOpacity(0.5),
                            progressColor: Colors.blue,
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), // 둥근 모서리
                          border: Border.all(color: Colors.black), // 까만색 테두리
                          color: Colors.white, // 하얀색 배경
                        ),
                        child: CheckboxListTile(
                          title: const Text(
                            '토익 스피킹 5급 이상',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          // value: context.read<CommonInfo>().isTOEICLevel5OrHigher,
                          value: isTOEICLevel5OrHigher,
                          onChanged: (newValue) async {
                            // 체크하는 경우
                            if (newValue == true) {
                              await setSubject(
                                  db, auth, "english", "토익", 0, "0-0");
                            }
                            // 체크를 해제하는 경우
                            else {
                              await deleteSubject(db, auth, "english", "토익");
                            }
                            setState(() {
                              // context.read<CommonInfo>().fillTOEICLevel5OrHigher();
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text(
                                '전공과목 중 영어A 3과목 이상 이수',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              // value: context.read<CommonInfo>().isEngA3rHigher,
                              value: isEngA3rHigher,
                              onChanged: (newValue) async {
                                // 체크하는 경우
                                if (newValue == true) {
                                  await setSubject(
                                      db, auth, "english", "영어A", 0, "0-0");
                                }
                                // 체크를 해제하는 경우
                                else {
                                  await deleteSubject(
                                      db, auth, "english", "영어A");
                                }
                                setState(() {
                                  // context.read<CommonInfo>().fillEngA3rHigher();
                                });
                              },
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _textController,
                                    decoration: InputDecoration(
                                      hintText: '수강한 과목명 입력',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black), // 테두리 색상 변경
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: '수강한 과목명 입력',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black), // 테두리 색상 변경
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: '수강한 과목명 입력',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black), // 테두리 색상 변경
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //const ProgressBar(),
                      Container(
                        height: 60,
                        // color: Colors.indigo,
                      ),
                      //const CommonMenu(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
