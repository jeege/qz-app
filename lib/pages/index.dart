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
  List<Widget> navList1 = [];
  List<Widget> navList2 = [];

  _init() async {
    nav1 = await getNav('1');
    nav2 = await getNav('2');
    setState(() {
      navList1 = toList(nav1.data);
      navList2 = toList(nav2.data);
    });
  }

  toList(data) {
    return data.map<Widget>((item) {
      return Expanded(
          flex: 1,
          child: OutlineButton(
            padding: EdgeInsets.all(4.0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListPage(
                            // title: item.name,
                            title: '视频',
                          )));
            },
            // child: Text(item.name),
            child: Text('视频'),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '首页',
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text('AV导航：', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: navList1,
                ),
                // Text('短片导航：', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: navList2,
                )
              ],
            )));
  }
}
