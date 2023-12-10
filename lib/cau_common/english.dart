import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../sideMenu.dart';
import 'common_info.dart';

class English extends StatefulWidget {
  const English({super.key});

  @override
  State<English> createState() => _EnglishState();
}

class _EnglishState extends State<English> {
  TextEditingController _textController = TextEditingController();
  bool isTOEICLevel5OrHigher = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '영어',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: const SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), // 둥근 모서리
                        border: Border.all(color: Colors.black), // 까만색 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      padding: const EdgeInsets.all(20), // 안쪽 여백 설정
                      child: const Text(
                        '토익 스피킹 5급 이상 혹은 전공 과목 중 영어A 3과목 이상 이수',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                if (context.read<CommonInfo>().isTOEICLevel5OrHigher == true ||
                    context.read<CommonInfo>().isEngA3rHigher == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 1.0,
                      center: Text('100%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.read<CommonInfo>().isTOEICLevel5OrHigher == false &&
                    context.read<CommonInfo>().isEngA3rHigher == false)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.0,
                      center: Text('0%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.5),
                      progressColor: Colors.blue,
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
                      '토익 스피킹 5급 이상',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    value: context.read<CommonInfo>().isTOEICLevel5OrHigher,
                    onChanged: (newValue) {
                      setState(() {
                        context.read<CommonInfo>().fillTOEICLevel5OrHigher();
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: const Text(
                          '전공과목 중 영어A 3과목 이상 이수',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().isEngA3rHigher,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillEngA3rHigher();
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: '수강한 과목명 입력',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black), // 테두리 색상 변경
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                hintText: '수강한 과목명 입력',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black), // 테두리 색상 변경
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                hintText: '수강한 과목명 입력',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black), // 테두리 색상 변경
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
