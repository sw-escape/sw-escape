import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/student.dart';

class ModifyInfo extends StatefulWidget {
  final String? selectedStudentID;

  const ModifyInfo({super.key, this.selectedStudentID});

  @override
  State<ModifyInfo> createState() => _ModifyInfoState();
}

class _ModifyInfoState extends State<ModifyInfo> {
  late String selectedCharacter = 'assets/images/glasses_girl.png';
  @override
  Widget build(BuildContext context) {
    String? studentID = Provider.of<Student>(context).selectedStudentID;

    final _formkey = GlobalKey<FormState>(); // for textformfield validation
    TextEditingController _idController = TextEditingController(text: 'userid');
    TextEditingController _deptController =
        TextEditingController(text: '소프트웨어학과');
    // studentID에서 학번 연도 부분을 추출하여 정수로 변환하고, 그 값을 selectedYear 변수에 할당
    late int selectedYear = int.tryParse(studentID?.substring(0, 2) ?? '0') ?? 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            '정보 수정',
            style: TextStyle(color: Colors.black),
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
                                                        'assets/images/sunglasses_girl.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/sunglasses_girl.png', // 이미지 경로에 따라 수정해주세요
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
                                                        'assets/images/sunglasses_boy.png';
                                                  });
                                                  print(selectedCharacter);
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/images/sunglasses_boy.png', // 이미지 경로에 따라 수정해주세요
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.center,
                                          //   children: [
                                          //     ElevatedButton(
                                          //       style: ElevatedButton.styleFrom(
                                          //         primary: Colors.grey,
                                          //         shape: RoundedRectangleBorder(
                                          //           borderRadius: BorderRadius.circular(20),
                                          //         ),
                                          //         minimumSize: Size(100, 40), // 버튼의 최소 크기 지정
                                          //       ),
                                          //       onPressed: () => Navigator.of(context).pop(),
                                          //       child: Text('선택',
                                          //           style: TextStyle(color: Colors.white)),
                                          //     ),
                                          //   ],
                                          // ),
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '아이디',
                              style: TextStyle(fontSize: 16),
                            ),
                            TextFormField(
                              controller: _idController, // 컨트롤러 할당
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
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
                              controller: _deptController, // 컨트롤러 할당
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                //contentPadding: EdgeInsets.only(left: 10),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '학과를 입력해주세요';
                                }
                                return null;
                              },
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
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                              child: DropdownButtonFormField<int>(
                                value: selectedYear,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '학번을 선택해주세요',
                                ),
                                items: List.generate(10, (index) {
                                  return DropdownMenuItem<int>(
                                      value: 23 - index,
                                      child: Text('${23 - index}학번'));
                                }),
                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value!;
                                  });
                                },
                                validator: (value) {
                                  if (value == 0) {
                                    return '학번을 선택해주세요';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
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

class characterSelect extends StatefulWidget {
  const characterSelect({super.key});

  @override
  State<characterSelect> createState() => _characterSelectState();
}

class _characterSelectState extends State<characterSelect> {
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
                                      'assets/images/sunglasses_girl.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/sunglasses_girl.png', // 이미지 경로에 따라 수정해주세요
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
                                      'assets/images/sunglasses_boy.png';
                                });
                                print(selectedCharacter);
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/sunglasses_boy.png', // 이미지 경로에 따라 수정해주세요
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
