import 'package:flutter/material.dart';

import 'MajorBasic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MajorBasic(),
    );
  }
}