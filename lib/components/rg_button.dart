import 'package:flutter/material.dart';

class RgButton extends StatelessWidget {

  RgButton(this.txt,{this.highlightColor,this.height,this.color = Colors.blue, this.minWidth = 0.0,this.borderColor = Colors.blue, this.bgColor, this.onTap});

  final String txt;
  final double minWidth;
  final double height;
  final Color color;
  final Color bgColor;
  final Color highlightColor;
  final Color borderColor;
  final Function onTap;

  @override
  Widget build(BuildContext context){
    return MaterialButton(
        textColor: color,
        minWidth: minWidth,
        height: height,
        color: bgColor,
        highlightColor: highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: borderColor),
        ),
        onPressed: onTap,
        // child: Text(item.name),
        child: Text(txt),
      );
  }
}