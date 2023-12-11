import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/student.dart';

import 'FirestoreManager.dart';

class ModifyInfo extends StatefulWidget {
  final String? selectedStudentID;

  const ModifyInfo({super.key, this.selectedStudentID});

  @override
  State<ModifyInfo> createState() => _ModifyInfoState();
}

class _ModifyInfoState extends State<ModifyInfo> {
  late String selectedCharacter = context.watch<Student>().character;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? studentID = Provider.of<Student>(context).selectedStudentID;

    final _formkey = GlobalKey<FormState>(); // for textformfield validation

    TextEditingController _idController = TextEditingController();
    TextEditingController _deptController = TextEditingController();
    TextEditingController _yearController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            '정보 수정',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 5),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF54A9F6),
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  left: 0,
                                  child: Image.asset(selectedCharacter),
                                  width: 90,
                                  height: 90,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('캐릭터 선택'),
                                    content: Text('캐릭터를 선택해주세요'),
                                    actions: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedCharacter =
                                                        'assets/images/glasses_girl.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/glasses_girl.png', // 이미지 경로에 따라 수정해주세요
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedCharacter =
                                                        'assets/images/character/sunglasses_girl.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/character/sunglasses_girl.png', // 이미지 경로에 따라 수정해주세요
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedCharacter =
                                                        'assets/images/hoddie_student.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/hoddie_student.png', // 이미지 경로에 따라 수정해주세요
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedCharacter =
                                                        'assets/images/character/sunglasses_boy.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/character/sunglasses_boy.png', // 이미지 경로에 따라 수정해주세요
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                    color: Colors.black), // 테두리 색상을 검은색으로 설정
                              ),
                              child: Text(
                                '캐릭터 변경',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FutureBuilder<Map<String, dynamic>>(
                        future: getUserData(db, auth),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            if (snapshot.hasData) {
                              Map<String, dynamic> userData = snapshot.data!;
                              _idController.text = userData['email'];
                              _deptController.text = userData['Major'];
                              _yearController.text = userData['StudentID'];

                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '이메일',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextFormField(
                                      controller: _idController, // 컨트롤러 할당
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        //contentPadding: EdgeInsets.only(left: 10),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '아이디를 입력해주세요';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      '학과',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextFormField(
                                      enabled: false,
                                      controller: _deptController, // 컨트롤러 할당
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        //contentPadding: EdgeInsets.only(left: 10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      '학번',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      enabled: false,
                                      controller: _yearController, // 컨트롤러 할당
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        //contentPadding: EdgeInsets.only(left: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // 데이터가 없는 경우 처리하는 UI
                              return Text('No data available');
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        context.read<Student>().setCharacter(selectedCharacter);
                        Navigator.pop(context); // 현재 페이지 닫기
                      }
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4EAAFF)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class characterSelectPanel extends StatefulWidget {
  const characterSelectPanel({super.key});

  @override
  State<characterSelectPanel> createState() => _characterSelectPanelState();
}

class _characterSelectPanelState extends State<characterSelectPanel> {
  @override
  Widget build(BuildContext context) {
    String selectedCharacter = 'assets/images/glasses_girl.png';
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF54A9F6),
                ),
              ),
              Positioned(
                top: 16,
                left: 0,
                child: Image.asset(
                  selectedCharacter, // 이미지 경로에 따라 수정해주세요
                  width: 90,
                  height: 90,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print(selectedCharacter);
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('캐릭터 선택'),
                  content: Text('캐릭터를 선택해주세요'),
                  actions: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCharacter =
                                      'assets/images/glasses_girl.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/glasses_girl.png', // 이미지 경로에 따라 수정해주세요
                                width: 90,
                                height: 90,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCharacter =
                                      'assets/images/character/sunglasses_girl.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/character/sunglasses_girl.png', // 이미지 경로에 따라 수정해주세요
                                width: 90,
                                height: 90,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCharacter =
                                      'assets/images/hoddie_student.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/hoddie_student.png', // 이미지 경로에 따라 수정해주세요
                                width: 90,
                                height: 90,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCharacter =
                                      'assets/images/character/sunglasses_boy.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/character/sunglasses_boy.png', // 이미지 경로에 따라 수정해주세요
                                width: 90,
                                height: 90,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black), // 테두리 색상을 검은색으로 설정
            ),
            child: Text(
              '캐릭터 변경',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
