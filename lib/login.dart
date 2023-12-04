// 로그인

import 'package:flutter/material.dart';
import 'main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF5BB0FF), Color(0xFF78BEFF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SW ESCAPE',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 48,
                  color: Colors.white,
                  shadows: [
                    Shadow(offset: Offset(-1.5, 0), color: Colors.black),
                    Shadow(offset: Offset(1.5, 0), color: Colors.black),
                    Shadow(offset: Offset(0, -1.5), color: Colors.black),
                    Shadow(offset: Offset(0, 1.5), color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 320, // 원하는 가로 너비로 설정
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  EMAIL',
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
                      SizedBox(height: 0),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // 패딩 조정
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '이메일을 입력하세요';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 7),
                      Text(
                        '  PASSWORD',
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
                      SizedBox(height: 0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // 패딩 조정
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '비밀번호를 입력하세요';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            boxShadow: [
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
                              if (_formKey.currentState!.validate()) {
                                try {
                                  final currentUser = await _authentication
                                      .signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  if (currentUser.user != null) {
                                    _formKey.currentState!.reset();
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                      ),
                                    );
                                  } else {
                                    print("로그인 실패: 사용자 정보가 없습니다.");
                                  }
                                } catch (e, stackTrace) {
                                  print("로그인 실패: $e");
                                  print("스택 트레이스: $stackTrace");
                                }
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                color: Colors.lightBlue[800],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              primary: Colors.white,
                              onPrimary: Colors.lightBlue[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(150),
                                side: BorderSide(color: Colors.black),
                              ),
                            ),
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
    );
  }
}
