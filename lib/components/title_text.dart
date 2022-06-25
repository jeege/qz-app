import 'package:flutter/material.dart';

Widget titleText(String txt,
    {double fontSize = 16.0,
    double top = 10.0,
    double bottom = 8.0,
    double left = 0.0,
    double right = 0.0,
    Color color}) {
  return Container(
    margin: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: Text(txt,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color)),
  );
}
