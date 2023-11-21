import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progress.dart';

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
          IconButton(
            iconSize: 40,
            icon: const Icon(Icons.menu),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF72BBFF),
        child: Column(
          children: [
            Container(
              height: 30,
              // color: Colors.indigo,
            ),
            const ProgressBar(),
            Container(
              height: 30,
              // color: Colors.indigo,
            ),
            const MajorMenu(),
          ],
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////


class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  @override
  Widget build(BuildContext context) {
    int progress = context.select((Progress p) => p.majorProgress);
    int maxProgress = context.select((Progress p) => p.maxMajorProgress);

    return Center(
      child: Container(
        width: 320.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white, // 전체 진행 바의 배경색
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: (progress / maxProgress) * 320, // 현재 진척도에 따라 너비를 조절
            decoration: BoxDecoration(
              color: const Color(0xFFFB7AC0), // 진행 중인 부분의 배경색
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
            ),
          ),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////


class MajorMenu extends StatelessWidget {
  const MajorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // Column은 기본적으로 수평 정렬
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  fixedSize: const Size(140, 160), // 고정 크기 설정
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                          'assets/images/major/treestructure.png',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  fixedSize: const Size(140, 160), // 고정 크기 설정
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/engineering.png'
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  fixedSize: const Size(140, 160), // 고정 크기 설정
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/pavilion.png'
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  foregroundColor: Colors.black, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 둥글게 만듦
                    side: const BorderSide(color: Colors.black), // 테두리 색상
                  ),
                  fixedSize: const Size(140, 160), // 고정 크기 설정
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage(
                            'assets/images/major/calculator.png'
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
              fixedSize: const Size(300, 120), // 고정 크기 설정
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  child: Image(
                    image: AssetImage(
                        'assets/images/major/box.png'
                    ),
                  ),
                ),
                Text(
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
