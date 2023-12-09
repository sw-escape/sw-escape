import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/Progress.dart';
import 'package:sw_escape/ProgressBar.dart';

import '../sideMenu.dart';
import 'chinese_character.dart';
import 'common_liberal_arts.dart';
import 'core_liberal_arts.dart';
import 'english.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SW ESCAPE',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/Menu.png')),
          )
        ],
      ),
      endDrawer: SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: Column(
          children: [
            // ProgressBar(
            //   currentProgress: context.select((Progress p) => p.commonProgress),
            //   maxProgress: context.select((Progress p) => p.commonProgressMax),
            //   width: 320.0,
            //   height: 40.0,
            //   color: Color(0xFFAD6DDF),
            // ),
            Container(
              height: 60,
              // color: Colors.indigo,
            ),
            CommonMenu(),
          ],
        ),
      ),
    );
  }
}


class CommonMenu extends StatelessWidget {
  CommonMenu({super.key});

  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Progress bar를 위해서, firestore에서 데이터 불러오기
    context.read<Progress>().loadNumberProgress(db, auth, "english");
    context.read<Progress>().loadNumberProgress(db, auth, "chinese");
    context.read<Progress>().loadNumberProgress(db, auth, "common");
    context.read<Progress>().loadNumberProgress(db, auth, "core");

    return Column(
      // Column은 기본적으로 수평 정렬
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => English()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 80), // 고정 크기 설정
              fixedSize: const Size(320, 100), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ProgressBar(
                  currentProgress: context.select((Progress p)=>p.requirementsProgress["english"]!),
                  maxProgress: context.select((Progress p) => p.englishMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.red,
                ),
                const SizedBox(height: 5,),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      child: Image(
                        width: 60,
                        image: AssetImage(
                          'assets/images/common/english.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '영어',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChineseCharacter()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 80), // 고정 크기 설정
              fixedSize: const Size(320, 100), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ProgressBar(
                  currentProgress: context.select((Progress p)=>p.requirementsProgress["chinese"]!),
                  maxProgress: context.select((Progress p) => p.chineseMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.orange,
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    SizedBox(width: 35,),
                    SizedBox(
                      child: Image(
                        width: 50,
                        image: AssetImage(
                          'assets/images/common/chinese.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '한문',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommonLiberalArts()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 80), // 고정 크기 설정
              fixedSize: const Size(320, 100), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ProgressBar(
                  currentProgress: context.select((Progress p)=>p.requirementsProgress["common"]!),
                  maxProgress: context.select((Progress p) => p.commonMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      child: Image(
                        width: 50,
                        image: AssetImage(
                          'assets/images/common/knowledge.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '공통 교양',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CoreLiberalArts()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 80), // 고정 크기 설정
              fixedSize: const Size(320, 100), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.requirementsProgress["core"]!),
                  maxProgress: context.select((Progress p) => p.coreMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.green,
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      child: Image(
                        width: 50,
                        image: AssetImage(
                          'assets/images/common/study.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '핵심 교양',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
