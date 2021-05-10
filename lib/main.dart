import 'package:flutter/material.dart';
import 'package:quiz_app/nav_drawer.dart';

import 'quiz_app.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: QuizApp(),
    );
  }
}

