import 'package:flutter/material.dart';
import './tumi_app.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      home: SafeArea(
        child: Builder(
          builder: (context) => TumiApp(),
        ),
      ),
    );
  }
}


