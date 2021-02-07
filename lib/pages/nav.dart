import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/model/version.dart';
import 'package:qz_app/pages/qiezi.dart';
import 'package:qz_app/pages/test.dart';
import 'package:qz_app/pages/vipvideo.dart';
import 'package:qz_app/pages/xiangjiao.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:url_launcher/url_launcher.dart';

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
    if (!isExits) {
      print('---------创建表');
      await db.execute(createHistoryTable);
    }
    db.close();
  }

  compareVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final latestVersion = await getLatestVersion();
    if (latestVersion.version != '') {
      print(
          '最新版本：${latestVersion.version}\n最新app地址：${latestVersion.url}\n本地版本：${packageInfo.version}');
      final updateFlag =
          checkVersion(packageInfo.version, latestVersion.version);
      if (updateFlag) {
        showDialog<int>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('提示'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('发现新版本，是否立即更新？'),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop(0);
                  },
                ),
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop(1);
                  },
                ),
              ],
            );
          },
        ).then((val) {
          if (val == 1) {
            launchURL(latestVersion.url);
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "已经是最新版本了",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white);
      }
    }
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  checkVersion(v1, v2) {
    bool flag = false;
    List<String> arr1 = v1.toLowerCase().split('.');
    List<String> arr2 = v2.toLowerCase().split('.');
    for (var i = 0; i < arr2.length; i++) {
      if (int.parse(arr2[i]) > int.parse(arr1[i])) {
        flag = true;
        break;
      }
    }
    return flag;
  }

  getLatestVersion() async {
    // 获取app版本
    try {
      dynamic res = await getVersion();
      return new LatestInfo(res.tagName, res.assets[0].browserDownloadUrl);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
      return new LatestInfo('', '');
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
            padding: EdgeInsets.only(top: 60.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    generateBtn('香蕉视频', Xiangjiao()),
                    generateBtn('茄子视频', Qiezi()),
                    generateBtn('免费视频', VipVideo()),
                    generateBtn('收藏记录', TestPage()),
                    RgButton(
                      '检查更新',
                      height: 50.0,
                      color: Colors.white,
                      bgColor: Colors.blue,
                      highlightColor: Colors.blue[400],
                      onTap: () {
                        compareVersion();
                      },
                    ),
                  ]),
            )));
  }
}
