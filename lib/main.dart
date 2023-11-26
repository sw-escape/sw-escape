import 'package:flutter/material.dart';
import 'package:sw_escape/student.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Student()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            //useMaterial3: true,
            fontFamily: 'NanumBarunGothic'),
        home: const MainPage(),
      ),
    );
  }
}
