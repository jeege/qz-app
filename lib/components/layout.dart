import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  PageLayout({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: body
    );
  }
}