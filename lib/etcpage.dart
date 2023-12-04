import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/CodingBootCamp.dart';
import 'package:sw_escape/GraduateThesisTopcit.dart';
import 'package:sw_escape/CapstoneInternURS.dart';
import 'package:sw_escape/LowestGraduateGPA.dart';
import 'package:sw_escape/MACHCourses.dart';
import 'package:sw_escape/ProfessorInterview.dart';
import 'progress.dart';
import 'ProgressBar.dart';

import 'sideMenu.dart';

class EtcPage extends StatelessWidget {
  const EtcPage({super.key});

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
            // ProgressBar(
            //   currentProgress: context.select((Progress p) => p.majorRequiredProgress),
            //   maxProgress: context.select((Progress p) => p.majorRequiredProgressMax),
            //   width: 120.0,
            //   height: 20.0,
            //   color: const Color(0xFF76DF6D),
            // ),
            Container(
              height: 20,
              // color: Colors.indigo,
            ),
            const EtcMenu(),
          ],
        ),
      ),
    );
  }
}


class EtcMenu extends StatelessWidget {
  const EtcMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // Column은 기본적으로 수평 정렬
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return CodingBootCampDialog();
              }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.codingBootCampDialogProgress),
                  maxProgress: context.select((Progress p) => p.codingBootCampDialogProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.red,
                ),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 50,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/code.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '코딩부트캠프',
                          style: TextStyle(
                            fontSize: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return GraduateThesisTopcitDialog();
                }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.graduateThesisTopcitDialogProgress),
                  maxProgress: context.select((Progress p) => p.graduateThesisTopcitDialogProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.orange,
                ),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 50,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/pencil.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '졸업논문/TOPCIT',
                          style: TextStyle(
                            fontSize: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CapInternURSDialog();
                }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.capstoneProgress),
                  maxProgress: context.select((Progress p) => p.capstoneProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.yellow,
                ),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 50,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/light.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '캡스톤/인턴/학부연구생',
                          style: TextStyle(
                            fontSize: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MACHCourseDialog();
                }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.machCourseDialogProgress),
                  maxProgress: context.select((Progress p) => p.machCourseDialogProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.green,
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 30,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/book.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'MACH 교양',
                          style: TextStyle(
                            fontSize: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LowestGraduateGPADialog();
                }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.lowestGraduateGPADialogProgress),
                  maxProgress: context.select((Progress p) => p.lowestGraduateGPADialogProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.blue,
                ),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 50,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/grades.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '최저 졸업 평점',
                          style: TextStyle(
                            fontSize: 20,
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
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProfessorInterviewDialog();
                }
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 배경색
              foregroundColor: Colors.black, // 텍스트 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 모서리를 둥글게 만듦
                side: const BorderSide(color: Colors.black), // 테두리 색상
              ),
              // fixedSize: const Size(320, 70), // 고정 크기 설정
              fixedSize: const Size(320, 80), // 고정 크기 설정
            ),
            child: Column(
              children: [
                const SizedBox(height: 5,),
                ProgressBar(
                  currentProgress: context.select((Progress p) => p.professorInterviewDialogProgress),
                  maxProgress: context.select((Progress p) => p.professorInterviewDialogProgressMax),
                  width: 250.0,
                  height: 20.0,
                  color: Colors.purpleAccent,
                ),
                const Row(
                  children: [
                    SizedBox(width: 30,),
                    SizedBox(
                      height: 50,
                      child: Image(
                        image: AssetImage(
                          'assets/images/etc/guardian.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '교수님 면담',
                          style: TextStyle(
                            fontSize: 20,
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