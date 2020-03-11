import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/pages/qiezi.dart';
import 'package:qz_app/pages/test.dart';
import 'package:qz_app/pages/xiangjiao.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';

import '../config.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  Database db;

  @override
  void initState() {
    super.initState();
    init();
  }
  
  void init() async {
    db = await getDb(dbName);
    bool isExits = await isTableExits(db, 'history_table');
    if(!isExits){
      print('---------创建表');
      await db.execute(createHistoryTable);
    }
    db.close();
  }

  @override
  Widget build(BuildContext context) {
    Widget generateBtn(txt, Widget widget) {
      return RgButton(
        txt,
        height: 50.0,
        color: Colors.white,
        bgColor: Colors.blue,
        highlightColor: Colors.blue[400],
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => widget));
        },
      );
    }

    return PageLayout(
        title: '首页',
        body: Container(
            padding: EdgeInsets.only(top:60.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    generateBtn('播放记录', TestPage()),
                    generateBtn('香蕉视频', Xiangjiao()),
                    generateBtn('茄子视频', Qiezi()),
                  ]),
            )));
  }
}