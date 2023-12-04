import 'package:flutter/material.dart';
import 'package:sw_escape/progress.dart';
import 'package:sw_escape/student.dart';
import 'package:sw_escape/Major.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Student()),
        ChangeNotifierProvider(create: (_) => Progress()),
        ChangeNotifierProvider(create: (_) => Major()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false, // 'debug' 텍스트 없앰
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            //useMaterial3: true,
            fontFamily: 'NanumBarunGothic'),
        // home: HomePage(), //** splash 페이지로 교체함
        home: SplashScreen(), //** splash 페이지로 교체함
      ),
    );
  }
}
