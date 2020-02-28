import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/pages/video.dart';

class ListPage extends StatelessWidget {
  ListPage({Key key, this.title}): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: title,
      body: Center(
        child: VideoPage()
      )
    );
  }
}
