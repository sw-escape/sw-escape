import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sw_escape/student.dart';
import 'start.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupSetScreen extends StatefulWidget {
  @override
  _SignupSetScreenState createState() => _SignupSetScreenState();
}

class _SignupSetScreenState extends State<SignupSetScreen> {
  String? selectedStudentID;
  String? selectedMajor;
  bool saving = false;
  final _authentication = FirebaseAuth.instance;

  final List<String> studentIDs = [
    '15학번',
    '16학번',
    '17학번',
    '18학번',
    '19학번',
    '20학번',
    '21학번',
    '22학번',
    '23학번',
  ];

  final List<String> majors = [
    'Major',
    'Double Major',
    'Transfer Student',
    'Exchange Student',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'SW ESCAPE',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 48,
                    color: Color(0xFF5BB0FF),
                    shadows: [
                      Shadow(offset: Offset(-1.5, 0), color: Colors.black),
                      Shadow(offset: Offset(1.5, 0), color: Colors.black),
                      Shadow(offset: Offset(0, -1.5), color: Colors.black),
                      Shadow(offset: Offset(0, 1.5), color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5BB0FF),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '  Student_ID',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                                offset: Offset(-1.1, 0), color: Colors.black),
                            Shadow(offset: Offset(1.1, 0), color: Colors.black),
                            Shadow(
                                offset: Offset(0, -1.1), color: Colors.black),
                            Shadow(offset: Offset(0, 1.1), color: Colors.black),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      DropdownButtonFormField<String>(
                        value: selectedStudentID,
                        onChanged: (value) {
                          setState(() {
                            selectedStudentID = value!;
                          });
                        },
                        items: studentIDs.map((id) {
                          return DropdownMenuItem<String>(
                            value: id,
                            child: Text(id),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                const BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '  Major',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                                offset: Offset(-1.1, 0), color: Colors.black),
                            Shadow(offset: Offset(1.1, 0), color: Colors.black),
                            Shadow(
                                offset: Offset(0, -1.1), color: Colors.black),
                            Shadow(offset: Offset(0, 1.1), color: Colors.black),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      DropdownButtonFormField<String>(
                        value: selectedMajor,
                        onChanged: (value) {
                          setState(() {
                            selectedMajor = value!;
                          });
                        },
                        items: majors.map((major) {
                          return DropdownMenuItem<String>(
                            value: major,
                            child: Text(major),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                const BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50), // 여기로 이동
                      Center(
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2.5, 2),
                                blurRadius: 0,
                                spreadRadius: -3,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                saving = true;
                              });
                              // int year = int.tryParse(selectedStudentID!.substring(0, 2)) ?? 0; // '21학번'에서 '21'을 추출하여 정수로 변환
                              // String dept = selectedMajor ?? ''; // selectedMajor 값이 null이 아니면 사용, null이면 빈 문자열 사용
                              //
                              // Provider.of<Student>(context, listen: false).setInfo('userid', dept, year);
                              final newUser = await _authentication.currentUser;
                              await FirebaseFirestore.instance.collection('users').doc(newUser!.uid).update({
                                'StudentID': selectedStudentID,
                                'Major': selectedMajor,
                              });
                              Provider.of<Student>(context, listen: false)
                                  .setSelectedStudentID(selectedStudentID);

                              FocusScope.of(context).unfocus();
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StartScreen()),
                              );
                              setState(() {
                                saving = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.lightBlue[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(150),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Text(
                              'JOIN',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.lightBlue[800],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
