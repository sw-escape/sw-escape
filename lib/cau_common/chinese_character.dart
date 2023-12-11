import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Progress.dart';
import '../FirestoreManager.dart';

import '../sideMenu.dart';
import 'common_info.dart';

class ChineseCharacter extends StatefulWidget {
  const ChineseCharacter({super.key});

  @override
  State<ChineseCharacter> createState() => _ChineseCharacterState();
}

class _ChineseCharacterState extends State<ChineseCharacter> {
  bool? isChineseCharL4 = false;
  bool? hasAttendedChineseCharClass = false;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> checkExistedData() async {
    isChineseCharL4 = await isExisted(db, auth, "chinese", "한자4급");
    hasAttendedChineseCharClass = await isExisted(db, auth, "chinese", "한자수업");
    isChineseCharL4 ??= false;
    hasAttendedChineseCharClass ??= false;
  }

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "chinese");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '한문',
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
                    icon: Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: SideMenu(),
      body: FutureBuilder(
        future: checkExistedData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Container(
              // color: Colors.blue,
              color: const Color(0xFF72BBFF),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: const Text(
                                '한문 수업 1과목 수강 혹은 한자 시험 4급 이상',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // if (context.read<CommonInfo>().isChineseCharL4 == true ||
                      //     context.read<CommonInfo>().hasAttendedChineseCharClass == true)
                      if (isChineseCharL4 == true ||
                          hasAttendedChineseCharClass == true)
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
                      // if (context.read<CommonInfo>().isChineseCharL4 == false &&
                      //     context.read<CommonInfo>().hasAttendedChineseCharClass == false)
                      if (isChineseCharL4 == false &&
                          hasAttendedChineseCharClass == false)
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
                            '한자 시험 4급 이상',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          // value: context.read<CommonInfo>().isChineseCharL4,
                          value: isChineseCharL4,
                          onChanged: (newValue) async {
                            // 체크하는 경우
                            if(newValue == true){
                              await setSubject(db, auth, "chinese", "한자4급", 0, "0-0");
                            }
                            // 체크를 해제하는 경우
                            else {
                              await deleteSubject(db, auth, "chinese", "한자4급");
                            }
                            setState(() {
                              // context.read<CommonInfo>().fillChineseCharL4();
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '한자 수업 수강',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: '수강한 과목명 입력 후 체크',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  // value: context
                                  //     .read<CommonInfo>()
                                  //     .hasAttendedChineseCharClass,
                                  value: hasAttendedChineseCharClass,
                                  onChanged: (newValue) async {
                                    // 체크하는 경우
                                    if(newValue == true){
                                      await setSubject(db, auth, "chinese", "한자수업", 0, "0-0");
                                    }
                                    // 체크를 해제하는 경우
                                    else {
                                      await deleteSubject(db, auth, "chinese", "한자수업");
                                    }
                                    setState(() {
                                      // context
                                      //     .read<CommonInfo>()
                                      //     .fillAttendedChineseCharClass();
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
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
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
