// 회원가입

import 'package:flutter/material.dart';
import 'signupSet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    final availableHeight = screenHeight - keyboardHeight;

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
                  height: MediaQuery.of(context).size.height * 0.45,

                  decoration: BoxDecoration(
                    color: const Color(0xFF5BB0FF),
                    borderRadius: BorderRadius.circular(50), // 큰 박스 모서리 둥글게
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ID
                        const Text(
                          '  EMAIL',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // Left
                                offset: Offset(-1.1, 0),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Right
                                offset: Offset(1.1, 0),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Top
                                offset: Offset(0, -1.1),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Bottom
                                offset: Offset(0, 1.1),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 0),
                        TextFormField(
                          obscureText: false, // 입력 안 보이게
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            // 비밀번호 폼 높이, 너비
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // 포커스 됐을 때의 테두리
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(height: 10),

                        // PW
                        const Text(
                          '  PASSWORD',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                // Left
                                offset: Offset(-1.1, 0),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Right
                                offset: Offset(1.1, 0),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Top
                                offset: Offset(0, -1.1),
                                color: Colors.black,
                              ),
                              Shadow(
                                // Bottom
                                offset: Offset(0, 1.1),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 0),
                        TextFormField(
                          obscureText: true, // 입력 안 보이게
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            // 비밀번호 폼 높이, 너비
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // 포커스 됐을 때의 테두리
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 50),

                        // NEXT
                        Center(
                          child: Container(
                            width: 130, // 로그인 버튼 너비
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              // 그림자 모서리 둥글게
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2.5, 2), // 그림자 위치
                                  blurRadius: 0, // 그림자 스프레드
                                  spreadRadius: -3, // 그림자 크기
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  setState(() {
                                    saving = true;
                                  });
                                  final newUser = await _authentication
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                                    'email' : email,
                                  });
                                  if (newUser.user != null) {
                                    // 회원가입 성공
                                    _formKey.currentState!.reset();
                                    if (!mounted) return;
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(context, _createRoute());
                                  } else {
                                    // 회원가입 실패 처리
                                    print("회원가입 실패: 사용자 정보가 없습니다.");
                                  }
                                  setState(() {
                                    saving = false;
                                  });
                                } catch (e, stackTrace) {
                                  print("회원가입 실패: $e");
                                  print("스택 트레이스: $stackTrace");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                // 로그인 버튼 높이
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.lightBlue[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Text('NEXT',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    color: Colors.lightBlue[800],
                                    fontStyle: FontStyle.italic,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SignupSetScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 현재 화면에 대한 슬라이드 효과
        var currentScreenSlide = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.0, 0.0),
        ).animate(animation);

        // 새 화면에 대한 슬라이드 효과
        var newScreenSlide = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);

        return Stack(
          children: <Widget>[
            SlideTransition(
              position: currentScreenSlide,
              child: const SignupForm(), // 현재 화면
            ),
            SlideTransition(
              position: newScreenSlide,
              child: child, // 새 화면
            ),
          ],
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // 현재 -> 새로운 페이지 전환 시간
    );
  }
}
