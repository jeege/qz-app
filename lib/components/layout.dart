import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  PageLayout({Key key, this.title, this.body, this.bgc = Colors.white, this.btn, this.rightAction}) : super(key: key);

  final dynamic title;
  final Widget body;
  final Widget btn;
  final Color bgc;
  final List<Widget> rightAction;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title is String ? Text(title) : title,
        actions: rightAction,
      ),
      backgroundColor: bgc,
      body: body,
      floatingActionButton: btn
    );
  }
}