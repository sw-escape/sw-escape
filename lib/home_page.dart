import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/major/majorpage.dart';
import 'package:sw_escape/student.dart';

import 'MajorBasic.dart';
import 'cau_common/commonpage.dart';
import 'etc/etcpage.dart';
import 'modify_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String? selectedStudentID = Provider.of<Student>(context).selectedStudentID;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            'assets/images/swescape_title.png',
            height: 40, // 이미지의 폭을 조정할 수 있습니다.
          ),
          actions: [
            // Add your icon button here
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ModifyInfo(selectedStudentID: selectedStudentID),
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF54A9F6), Color(0xFF93CBFF)],
            ),
          ),
          child: Column(
            children: [
              MyInfo(),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MajorBasic(), // 이동할 화면 위젯
                          ),
                        );
                      },
                      child: Material(
                        elevation: 4, // elevation 정도
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.42,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                            color: Color(0xffFBBC05),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2.0, // 테두리 두께
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/home/Brick.png', // 이미지 경로
                                  width: 90, // 이미지 너비 조정
                                  height: 90, // 이미지 높이 조정
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '전공기초',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MajorPage(), // 이동할 화면 위젯
                          ),
                        );
                      },
                      child: Material(
                        elevation: 4, // elevation 정도
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.42,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2.0, // 테두리 두께
                            ),
                            color: Color(0xffFB7AC0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/home/Studio Display.png', // 이미지 경로
                                  width: 90, // 이미지 너비 조정
                                  height: 90, // 이미지 높이 조정
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '전공',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EtcPage(), // 이동할 화면 위젯
                          ),
                        );
                      },
                      child: Material(
                        elevation: 4, // elevation 정도
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.42,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2.0, // 테두리 두께
                            ),
                            color: Color(0xff76DF6D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/home/Icons8.png', // 이미지 경로
                                  width: 90, // 이미지 너비 조정
                                  height: 90, // 이미지 높이 조정
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '기타',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommonPage(), // 이동할 화면 위젯
                          ),
                        );
                      },
                      child: Material(
                        elevation: 4, // elevation 정도
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.42,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2.0, // 테두리 두께
                            ),
                            color: Color(0xffAD6DDF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/home/University.png', // 이미지 경로
                                  width: 90, // 이미지 너비 조정
                                  height: 90, // 이미지 높이 조정
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '공통 졸업 요건',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    String? studentID = Provider.of<Student>(context).selectedStudentID;

    return Container(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            /* profile character */
            Column(
              children: [
                Stack(
                  //clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 45),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 3), // 그림자 위치
                            blurRadius: 0, // 그림자 스프레드
                            spreadRadius: -1, // 그림자 크기
                          ),
                        ],
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        color: Color(0xFF54A9F6),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 45,
                      child: Image.asset(
                        context.watch<Student>().character,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@userid',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '소프트웨어학부(전공)',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    '${studentID}', // ${student.entranceYear}
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
