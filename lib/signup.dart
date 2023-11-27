
// 회원가입



import 'package:flutter/material.dart';
import 'signupSet.dart';



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
      home: SignupScreen(),
    );
  }
}





class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
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
                  color: Color(0xFF5BB0FF),
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
                width: MediaQuery.of(context).size.width * 0.87, // 큰 박스 크기
                decoration: BoxDecoration(
                  color: Color(0xFF5BB0FF),
                  borderRadius: BorderRadius.circular(50), // 큰 박스 모서리 둥글게
                  border: Border.all(color: Colors.black, width: 1),
                ),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ID
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
                      obscureText: false, // 입력 안 보이게
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
                    SizedBox(height: 10),

                    // PW
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
                    SizedBox(height: 50),

                    // NEXT
                    Center(
                      child: Container(
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
                            Navigator.push(context, _createRoute());
                          },
                          child: Text('NEXT', style: TextStyle(fontFamily: 'iblack', fontSize: 18, color: Colors.lightBlue[800], fontStyle: FontStyle.italic,)),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignupSetScreen(),
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
              child: this, // 현재 화면
            ),
            SlideTransition(
              position: newScreenSlide,
              child: child, // 새 화면
            ),
          ],
        );
      },
      transitionDuration: Duration(milliseconds: 500), // 현재 -> 새로운 페이지 전환 시간
    );
  }


}