import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'majorpage.dart';
import 'progress.dart';
import 'commonpage.dart';
import 'etcpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Progress(),
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: MajorPage(), // 페이지 계속 바뀜
      ),
    );
  }
}