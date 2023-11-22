
// 스플래쉬 화면



import 'package:flutter/material.dart';
import 'dart:async';
import 'start.dart';



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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _imageAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.89), // 텍스트 위로 이동
    ).animate(_controller);

    _imageAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.46), // png 아래로 이동
    ).animate(_controller);

    Timer(Duration(seconds: 2), () {
      _controller.forward().whenComplete(() {
        Navigator.pushReplacement(context, _createRoute());
      });
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => StartScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF329BFC), Color(0xFF8DC6FA)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70),
              SlideTransition(
                position: _textAnimation,
                child: Text(
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
              ),
              SizedBox(height: 30),
              SlideTransition(
                position: _imageAnimation,
                child: Image.asset(
                  'assets/images/puang.png',
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

