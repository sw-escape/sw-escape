
// 시작 화면



import 'package:flutter/material.dart';

import 'splash.dart';

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
                    Shadow( // 왼쪽 테두리
                      offset: Offset(-1.5, 0),
                      color: Colors.black,
                    ),
                    Shadow( // 오른쪽 테두리
                      offset: Offset(1.5, 0),
                      color: Colors.black,
                    ),
                    Shadow( // 위쪽 테두리
                      offset: Offset(0, -1.5),
                      color: Colors.black,
                    ),
                    Shadow( // 아래쪽 테두리
                      offset: Offset(0, 1.5),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 300, // 로그인 버튼 너비
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()), // TODO 페이지 교체
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()), // TODO 페이지 교체
                    );
                  },
                  child: Text('회원가입', style: TextStyle(fontFamily: 'nbold', fontSize: 18, color: Colors.lightBlue[800]),),
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



