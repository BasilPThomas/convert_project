import 'package:convert_project/screen_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Convert',
      debugShowCheckedModeBanner: false,
      home: ScreenOne(),
    );
  }
}

