import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progress.dart';

import 'sideMenu.dart';

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
                icon: Image.asset('assets/images/Menu.png')
            ),
          )
        ],
      ),
      endDrawer: SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: Column(
          children: [
            Container(
              height: 30,
              // color: Colors.indigo,
            ),
            const ProgressBar(),
            Container(
              height: 60,
              // color: Colors.indigo,
            ),
            const CommonMenu(),
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
    int progress = context.select((Progress p) => p.commonProgress);
    int maxProgress = context.select((Progress p) => p.maxCommonProgress);

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
              color: const Color(0xFFAD6DDF), // 진행 중인 부분의 배경색
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


class CommonMenu extends StatelessWidget {
  const CommonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // Column은 기본적으로 수평 정렬
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: const Row(
              children: [
                SizedBox(
                  child: Image(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: const Row(
              children: [
                SizedBox(
                  child: Image(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: const Row(
              children: [
                SizedBox(
                  child: Image(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: const Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image(
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
          ),
        ),
      ],
    );
  }
}