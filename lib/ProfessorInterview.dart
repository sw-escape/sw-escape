import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfessorInterviewDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfessorInterviewDialogState();
  }
}

class _ProfessorInterviewDialogState extends State<ProfessorInterviewDialog> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 500,
        //constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[Color(0xFF507BEC),Color(0xFFADC9FF)]
            )
        ),
        child: Column(
          children: [
            Image.asset('assets/교수님 면담 4회.png'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 100,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('CAU 세미나(1)', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45.withOpacity(0.5),
                              blurRadius: 3,
                              offset: const Offset(1.0,1.0),
                            )
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            focusColor: Colors.black,
                            value: _isChecked1,
                            onChanged: (value) {
                              setState(() {
                                _isChecked1 = value!;
                                //저장, progress bar 변경
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 100,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('CAU 세미나(1)', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45.withOpacity(0.5),
                              blurRadius: 3,
                              offset: const Offset(1.0,1.0),
                            )
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            focusColor: Colors.black,
                            value: _isChecked2,
                            onChanged: (value) {
                              setState(() {
                                _isChecked2 = value!;
                                //저장, progress bar 변경
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 100,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('CAU 세미나(1)', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45.withOpacity(0.5),
                              blurRadius: 3,
                              offset: const Offset(1.0,1.0),
                            )
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            focusColor: Colors.black,
                            value: _isChecked3,
                            onChanged: (value) {
                              setState(() {
                                _isChecked3 = value!;
                                //저장, progress bar 변경
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 100,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('CAU 세미나(1)', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45.withOpacity(0.5),
                              blurRadius: 3,
                              offset: const Offset(1.0,1.0),
                            )
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            focusColor: Colors.black,
                            value: _isChecked4,
                            onChanged: (value) {
                              setState(() {
                                _isChecked4 = value!;
                                //저장, progress bar 변경
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  maximumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.black45,
                ),
                onPressed: () async {
                  final url = Uri.parse(
                    'https://rainbow.cau.ac.kr/indexm.jsp?mobileyn=Y'
                  );
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                child: Transform.scale(
                    scale: 0.6,
                    child: Image.asset('assets/레인보우.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Transform.scale(
              scale: 1.5,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                        width: 1,
                        color: Colors.black
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Enter', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black45.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(1.0,1.0),
                        )
                      ]
                  ),
                  )
              ),
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.all(0.0),
    );
  }
}