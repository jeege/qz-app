import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/model/version.dart';
import 'package:qz_app/pages/qiezi.dart';
import 'package:qz_app/pages/test.dart';
import 'package:qz_app/pages/xiangjiao.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';

import '../config.dart';
import '../services.dart';

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
    // 初始化收藏表
    db = await getDb(dbName);
    bool isExits = await isTableExits(db, 'history_table');
    if(!isExits){
      print('---------创建表');
      await db.execute(createHistoryTable);
    }
    db.close();

    compareVersion();
    
  }

  compareVersion() async {
    final localVersion = await getLocalVersion();
    final latestVersion = await getLatestVersion();
    print('最新版本：${latestVersion.version}\n最新app地址：${latestVersion.url}\n本地版本：$localVersion');
    final updateFlag = checkVersion(localVersion, latestVersion.version);
    if(updateFlag){
      
    }
  }

  checkVersion(v1,v2){
    bool flag = false;
    List<String> arr1 =  v1.toLowerCase().substring(1).split('.');
    List<String> arr2 =  v2.toLowerCase().substring(1).split('.');
    for(var i = 0; i < arr2.length; i++) {
      if(int.parse(arr2[i]) > int.parse(arr1[i])){
        flag = true;
        break;
      }
    }
    return flag;
  }

  getLatestVersion() async {
    // 获取app版本
    dynamic res = await getVersion();
    while (res == null) {
      await Future.delayed(const Duration(milliseconds: 1000));
      res = await getVersion();
    }
    return new LatestInfo(res.tagName, res.assets[0].browserDownloadUrl);
  }

  getLocalVersion() async {
    try {
      final file = await localFile('version.txt');
      String _version = await file.readAsString();
      print('本地文件版本：$_version');
      return _version ?? 'v0.0.0';
    } catch (e) {
      return 'v0.0.0';
    }
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
        title: '导航',
        body: Container(
            padding: EdgeInsets.only(top:60.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    generateBtn('香蕉视频', Xiangjiao()),
                    generateBtn('茄子视频', Qiezi()),
                    generateBtn('收藏记录', TestPage()),
                  ]),
            )));
  }
}