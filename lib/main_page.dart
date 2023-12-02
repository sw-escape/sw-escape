import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/majorpage.dart';
import 'package:sw_escape/student.dart';

import 'commonpage.dart';
import 'etcpage.dart';
import 'modify_info.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'SW ESCAPE',
            style: TextStyle(
                color: Colors.black,
                //fontFamily: 'Inter',
                fontSize: 23,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic),
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
                    builder: (context) => ModifyInfo(), // 이동할 화면 위젯
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                child: Material(
                  elevation: 4, // elevation 정도
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
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
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
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
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
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
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
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
    return Material(
      elevation: 4, // elevation 정도
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40), // 왼쪽 아래 모서리의 둥글기 정도
        bottomRight: Radius.circular(40), // 오른쪽 아래 모서리의 둥글기 정도
      ),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Row(
          children: [
            /* profile character */
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 45),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
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
                    '21학번',
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
