import 'package:flutter/material.dart';

Widget titleText(String txt,
    {double fontSize = 16.0, double top = 10.0, double bottom = 8.0}) {
  return Container(
    margin: EdgeInsets.only(top: top, bottom: bottom),
    child: Text(txt,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
  );
}