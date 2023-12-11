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
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
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
    _textController1.text = context.watch<CommonInfo>().engA1;
    _textController2.text = context.watch<CommonInfo>().engA2;
    _textController3.text = context.watch<CommonInfo>().engA3;
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _textController1,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 5.0),
                                            hintText: '수강한 과목명 입력',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                            Size(30, 50), // 버튼의 가로, 세로 크기 조절
                                          ),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<CommonInfo>()
                                              .setEngA1(_textController1.text);
                                        },
                                        child: Text('입력'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _textController2,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 5.0),
                                            hintText: '수강한 과목명 입력',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black), //
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                            Size(30, 50), // 버튼의 가로, 세로 크기 조절
                                          ),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<CommonInfo>()
                                              .setEngA2(_textController2.text);
                                        },
                                        child: Text('입력'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _textController3,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 5.0),
                                            hintText: '수강한 과목명 입력',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(Colors
                                                  .black), // 버튼의 배경색을 검정색으로 지정
                                          side: MaterialStateProperty.all<
                                              BorderSide>(
                                            BorderSide(
                                                color: Colors.black,
                                                width: 2.0), // 테두리 설정
                                          ),
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                            Size(30, 50), // 버튼의 가로, 세로 크기 조절
                                          ),
                                        ),
                                        onPressed: () {
                                          // 버튼을 눌렀을 때 수행되는 동작
                                          context
                                              .read<CommonInfo>()
                                              .setEngA3(_textController3.text);
                                        },
                                        child: Text('입력'), // 버튼 텍스트
                                      )
                                    ],
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
