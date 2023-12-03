import 'package:flutter/material.dart';

import '../sideMenu.dart';

class ChineseCharacter extends StatefulWidget {
  const ChineseCharacter({super.key});

  @override
  State<ChineseCharacter> createState() => _ChineseCharacterState();
}

class _ChineseCharacterState extends State<ChineseCharacter> {
  bool isTOEICLevel5OrHigher = false;
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
                    icon: Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // 둥근 모서리
                    border: Border.all(color: Colors.black), // 까만색 테두리
                    color: Colors.white, // 하얀색 배경
                  ),
                  padding: const EdgeInsets.all(20), // 안쪽 여백 설정
                  child: const Text(
                    '한문 수업 1과목 수강\nOR 한자 시험 4급 이상',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
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
                      '한자 시험 4급 이상',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    value: isTOEICLevel5OrHigher,
                    onChanged: (newValue) {
                      setState(() {
                        isTOEICLevel5OrHigher = newValue!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '한자 수업',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '수강한 과목명 입력',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black), // 테두리 색상 변경
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
      ),
    );
  }
}
