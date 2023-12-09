import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sideMenu.dart';
import 'common_info.dart';

class CommonLiberalArts extends StatefulWidget {
  const CommonLiberalArts({super.key});

  @override
  State<CommonLiberalArts> createState() => _CommonLiberalArtsState();
}

class _CommonLiberalArtsState extends State<CommonLiberalArts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '공통 교양',
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
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), // 둥근 모서리
                        border: Border.all(color: Colors.black), // 까만색 테두리
                        color: Colors.white, // 하얀색 배경
                      ),
                      padding: const EdgeInsets.all(20), // 안쪽 여백 설정
                      child: const Text(
                        '총 7과목 이수해야 함',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // 둥근 모서리
                    border: Border.all(color: Colors.black), // 까만색 테두리
                    color: Colors.white, // 하얀색 배경
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1학년',
                        style: TextStyle(fontSize: 20),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          '글쓰기',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().writingIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillWriting();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'COMMUNICATION IN ENGLISH',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().commInEngIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillCommInEng();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          '앙트레프레너십 시대의 회계',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().accountIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillAccount();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          '창의와 소통',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value:
                            context.read<CommonInfo>().creativityNCommIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillCreativityNComm();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          '디자인적 사고와 문제해결',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value:
                            context.read<CommonInfo>().designThinkingIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillDesignThinking();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // 둥근 모서리
                    border: Border.all(color: Colors.black), // 까만색 테두리
                    color: Colors.white, // 하얀색 배경
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2학년',
                        style: TextStyle(fontSize: 20),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          '한국사',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().KHistoryIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillKHistory();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'ACT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        value: context.read<CommonInfo>().actIsFilled,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<CommonInfo>().fillAct();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
