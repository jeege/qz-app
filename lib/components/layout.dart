import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  PageLayout({Key key, this.title, this.body, this.bgc = Colors.white}) : super(key: key);

  final String title;
  final Widget body;
  final Color bgc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      backgroundColor: bgc,
      body: body
    );
  }
}