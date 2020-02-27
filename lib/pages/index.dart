import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:qz_app/components/layout.dart';
import 'package:qz_app/pages/list.dart';
import 'package:qz_app/services.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  dynamic nav1;
  dynamic nav2;
  List<Widget> navList = [];

  _init() async {
    nav1 = await getNav('1');
    nav2 = await getNav('2');
    setState(() {
      print(nav1);
      navList = jsonDecode(nav1).data.map((item) {
        return FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ListPage(
                          title: item.name,
                        )));
          },
          child: Text(item.name),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '首页',
        body: Container(
            child: Row(
          children: navList,
        )));
  }
}
