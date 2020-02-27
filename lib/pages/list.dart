import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';

class ListPage extends StatelessWidget {
  ListPage({Key key, this.title}): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: title,
      body: Center(
        child: Text('列表页内容')
      )
    );
  }
}
