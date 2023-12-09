import 'package:flutter/material.dart';
import 'package:sw_escape/start.dart';

import 'home_page.dart';
import 'MajorBasic.dart';
import 'major/majorpage.dart';
import 'etc/etcpage.dart';
import 'cau_common/commonpage.dart';
import 'modify_info.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF004BBB),
      width: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('메인',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MajorBasic()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전공 기초',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MajorPage()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전공',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EtcPage()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('기타',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CommonPage()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('공통 졸업 요건',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            const SizedBox(
              height: 200,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ModifyInfo()));
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('내 정보 수정',
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil( // StartScreen로 이동
                  context,
                  MaterialPageRoute(builder: (context) => StartScreen()),
                      (route) => false, // 현재 페이지 스택에서 제거
                );
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '로그아웃',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}