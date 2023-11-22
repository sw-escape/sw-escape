
// 로그인



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
      home: LoginScreen(),
    );
  }
}




class LoginScreen extends StatelessWidget {
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


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  ID',
                      style: TextStyle(
                        fontFamily: 'iblack',
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        shadows: [
                          Shadow( // Left
                            offset: Offset(-1.1, 0),
                            color: Colors.black,
                          ),
                          Shadow( // Right
                            offset: Offset(1.1, 0),
                            color: Colors.black,
                          ),
                          Shadow( // Top
                            offset: Offset(0, -1.1),
                            color: Colors.black,
                          ),
                          Shadow( // Bottom
                            offset: Offset(0, 1.1),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder( // 포커스 됐을 때의 테두리
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  PASSWORD',
                      style: TextStyle(
                        fontFamily: 'iblack',
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        shadows: [
                          Shadow( // Left
                            offset: Offset(-1.1, 0),
                            color: Colors.black,
                          ),
                          Shadow( // Right
                            offset: Offset(1.1, 0),
                            color: Colors.black,
                          ),
                          Shadow( // Top
                            offset: Offset(0, -1.1),
                            color: Colors.black,
                          ),
                          Shadow( // Bottom
                            offset: Offset(0, 1.1),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    TextFormField(
                      obscureText: true, // 입력 안 보이게
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // 비밀번호 폼 높이, 너비
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black,),
                        ),
                        focusedBorder: OutlineInputBorder( // 포커스 됐을 때의 테두리
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),

              Container(
                width: 130, // 로그인 버튼 너비
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150), // 그림자 모서리 둥글게
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
                      MaterialPageRoute(builder: (context) => SplashScreen()), // TODO 페이지 교체, 메인으로 이동
                    );
                  },
                  child: Text('LOGIN', style: TextStyle(fontFamily: 'iblack', fontSize: 18, color: Colors.lightBlue[800], fontStyle: FontStyle.italic,)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7), // 로그인 버튼 높이
                    primary: Colors.white,
                    onPrimary: Colors.lightBlue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150),
                      side: BorderSide(color: Colors.black),
                    ),
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
