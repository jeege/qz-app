import 'package:flutter/material.dart';
import 'package:qz_app/pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Index(),
    );
  }
}
