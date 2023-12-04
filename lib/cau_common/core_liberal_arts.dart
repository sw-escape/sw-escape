import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../sideMenu.dart';
import 'widgets.dart';
import 'common_info.dart';

class CoreLiberalArts extends StatefulWidget {
  const CoreLiberalArts({super.key});

  @override
  State<CoreLiberalArts> createState() => _CoreLiberalArtsState();
}

class _CoreLiberalArtsState extends State<CoreLiberalArts> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15),
                  child: Despcription(
                      description: '5개 역량에서 각 한 과목 이상 이수', height: 65),
                ),
                if (context.watch<CommonInfo>().filledCount == 0)
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
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.watch<CommonInfo>().filledCount == 1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.2,
                      center: Text('20%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.watch<CommonInfo>().filledCount == 2)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.4,
                      center: Text('40%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.watch<CommonInfo>().filledCount == 3)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.6,
                      center: Text('60%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.watch<CommonInfo>().filledCount == 4)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.8,
                      center: Text('80%',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                      progressColor: Colors.blue,
                    ),
                  ),
                if (context.watch<CommonInfo>().filledCount == 5)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(15),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black), // 검정 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      child: Column(
                        children: [
                          Text(
                            '도전',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          Checkbox(
                            value: context.read<CommonInfo>().challengeIsFilled,
                            visualDensity: VisualDensity(
                              horizontal: -2, // 가로 크기
                              vertical: -2, // 세로 크기
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                context.read<CommonInfo>().fillChallenge();
                                context.read<CommonInfo>().countFilledSkills();
                              });
                            },
                          ),
                          SizedBox(
                            width: 120, // 원하는 너비 값으로 수정하세요
                            child: TextButton(
                              onPressed: () async {
                                final url = Uri.parse(
                                    'http://ge.cau.ac.kr/course_list_haksim_1.php');
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url);
                                }
                              },
                              child: Text(
                                '과목 확인',
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white), // 배경색상
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.black), // 테두리 색상 및 굵기
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(15),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black), // 검정 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      child: Column(
                        children: [
                          Text(
                            '창의',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          Checkbox(
                            value:
                                context.read<CommonInfo>().creativityIsFilled,
                            visualDensity: VisualDensity(
                              horizontal: -2, // 가로 크기
                              vertical: -2, // 세로 크기
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                context.read<CommonInfo>().fillCreativity();
                                context.read<CommonInfo>().countFilledSkills();
                              });
                            },
                          ),
                          SizedBox(
                            width: 120, // 원하는 너비 값으로 수정하세요
                            child: TextButton(
                              onPressed: () async {
                                final url = Uri.parse(
                                    'http://ge.cau.ac.kr/course_list_haksim_1.php');
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url);
                                }
                              },
                              child: Text(
                                '과목 확인',
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white), // 배경색상
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.black), // 테두리 색상 및 굵기
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(15),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black), // 검정 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      child: Column(
                        children: [
                          Text(
                            '융합',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          Checkbox(
                            value:
                                context.read<CommonInfo>().convergenceIsFilled,
                            visualDensity: VisualDensity(
                              horizontal: -2, // 가로 크기
                              vertical: -2, // 세로 크기
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                context.read<CommonInfo>().fillConvergence();
                                context.read<CommonInfo>().countFilledSkills();
                              });
                            },
                          ),
                          SizedBox(
                            width: 120, // 원하는 너비 값으로 수정하세요
                            child: TextButton(
                              onPressed: () async {
                                final url = Uri.parse(
                                    'http://ge.cau.ac.kr/course_list_haksim_3.php');
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url);
                                }
                              },
                              child: Text(
                                '과목 확인',
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white), // 배경색상
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.black), // 테두리 색상 및 굵기
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(15),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black), // 검정 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      child: Column(
                        children: [
                          Text(
                            '신뢰',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          Checkbox(
                            value:
                                context.read<CommonInfo>().credibilityIsFilled,
                            visualDensity: VisualDensity(
                              horizontal: -2, // 가로 크기
                              vertical: -2, // 세로 크기
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                context.read<CommonInfo>().fillCredibility();
                                context.read<CommonInfo>().countFilledSkills();
                              });
                            },
                          ),
                          SizedBox(
                            width: 120, // 원하는 너비 값으로 수정하세요
                            child: TextButton(
                              onPressed: () async {
                                final url = Uri.parse(
                                    'http://ge.cau.ac.kr/course_list_haksim_4.php');
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url);
                                }
                              },
                              child: Text(
                                '과목 확인',
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white), // 배경색상
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.black), // 테두리 색상 및 굵기
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: 160,
                  margin: const EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black), // 검정 테두리
                    color: Colors.white, // 하얀색 배경
                  ),
                  child: Column(
                    children: [
                      Text(
                        '소통',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Checkbox(
                        value: context.read<CommonInfo>().communicationIsFilled,
                        visualDensity: VisualDensity(
                          horizontal: -2, // 가로 크기
                          vertical: -2, // 세로 크기
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillCommunication();
                            context.read<CommonInfo>().countFilledSkills();
                          });
                        },
                      ),
                      SizedBox(
                        width: 120, // 원하는 너비 값으로 수정하세요
                        child: TextButton(
                          onPressed: () async {
                            final url = Uri.parse(
                                'http://ge.cau.ac.kr/course_list_haksim_5.php');
                            if (await canLaunchUrl(url)) {
                              launchUrl(url);
                            }
                          },
                          child: Text(
                            '과목 확인',
                            style: TextStyle(
                              color: Colors.black, // 텍스트 색상
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // 배경색상
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: Colors.black), // 테두리 색상 및 굵기
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //const ProgressBar(),
                //const CommonMenu(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
