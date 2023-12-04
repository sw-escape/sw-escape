import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progress.dart';
import 'ProgressBar.dart';

import 'sideMenu.dart';
import 'MajorRequired.dart';
import 'EngineeringCertification.dart';
import 'DesignSubject.dart';
import 'BSM.dart';

class MajorPage extends StatelessWidget {
  const MajorPage({super.key});

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
                icon: Image.asset('assets/images/Menu.png')
            ),
          )
        ],
      ),
      endDrawer: const SideMenu(),
      body: Container(
        color: const Color(0xFF72BBFF),
        child: const Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: MajorMenu(),
            ),
          ],
        )
      ),
    );
  }
}


class MajorMenu extends StatelessWidget {
  const MajorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // Column은 기본적으로 수평 정렬
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding (
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // context.read<Progress>().increase();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MajorRequired()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  // fixedSize: const Size(140, 160), // 고정 크기 설정
                  fixedSize: const Size(160, 180), // 고정 크기 설정
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressBar(
                      currentProgress: context.select((Progress p) => p.majorRequiredProgress),
                      maxProgress: context.select((Progress p) => p.majorRequiredProgressMax),
                      width: 120.0,
                      height: 20.0,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                          'assets/images/major/treestructure.png',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '전공필수',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EngineeringCertification()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  // fixedSize: const Size(140, 160), // 고정 크기 설정
                  fixedSize: const Size(160, 180), // 고정 크기 설정
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressBar(
                      currentProgress: context.select((Progress p) => p.engineeringCertificationProgress),
                      maxProgress: context.select((Progress p) => p.engineeringCertificationProgressMax),
                      width: 120.0,
                      height: 20.0,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/engineering.png'
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '공학인증 필수과목',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DesignSubject()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  // fixedSize: const Size(140, 160), // 고정 크기 설정
                  fixedSize: const Size(160, 180), // 고정 크기 설정
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressBar(
                      currentProgress: context.select((Progress p) => p.designSubjectProgress),
                      maxProgress: context.select((Progress p) => p.designSubjectProgressMax),
                      width: 120.0,
                      height: 20.0,
                      color: Colors.yellow,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/pavilion.png'
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '설계 학점',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BSM()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  // fixedSize: const Size(140, 160), // 고정 크기 설정
                  fixedSize: const Size(160, 180), // 고정 크기 설정
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressBar(
                      currentProgress: context.select((Progress p) => p.bsmProgress),
                      maxProgress: context.select((Progress p) => p.bsmProgressMax),
                      width: 120.0,
                      height: 20.0,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/calculator.png'
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'BSM',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(300, 120), // 고정 크기 설정
              fixedSize: const Size(320, 140), // 고정 크기 설정
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.etcMajorProgress),
                  maxProgress: context.select((Progress p) => p.etcMajorProgressMax),
                  width: 120.0,
                  height: 20.0,
                  color: Colors.purpleAccent,
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 80,
                  child: Image(
                    image: AssetImage(
                        'assets/images/major/box.png'
                    ),
                  ),
                ),
                const Text(
                  '기타 전공과목',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
