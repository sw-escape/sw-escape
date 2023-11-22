
// 시작 화면



import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( // 배경 그라디언트
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF329BFC), Color(0xFF8DC6FA)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Text(
                'SW ESCAPE',
                style: TextStyle(
                  fontFamily: 'iblack',
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
                width: 300, // 로그인 버튼 너비
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // 그림자 모서리 둥글게
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3.5, 2.2), // 그림자 위치
                      blurRadius: 0, // 그림자 스프레드
                      spreadRadius: -2, // 그림자 크기
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0); // 오른쪽에서 슬라이드
                          var end = Offset.zero;
                          var curve = Curves.decelerate;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                  child: Text('로그인', style: TextStyle(fontFamily: 'nbold', fontSize: 18, color: Colors.lightBlue[800]),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7), // 로그인 버튼 높이
                    primary: Colors.white,
                    onPrimary: Colors.lightBlue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300, // 회원가입 버튼 너비
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // 그림자 모서리 둥글게
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3.5, 2.2), // 그림자 위치
                      blurRadius: 0, // 그림자 스프레드
                      spreadRadius: -2, // 그림자 크기
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0); // 오른쪽에서 슬라이드
                          var end = Offset.zero;
                          var curve = Curves.decelerate;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        fontFamily: 'nbold',
                        fontSize: 18,
                        color: Colors.lightBlue[800]
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7), // 회원가입 버튼 높이
                    primary: Colors.white,
                    onPrimary: Colors.lightBlue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Image.asset(
                'assets/images/puang.png',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



