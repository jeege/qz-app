import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/pages/qiezi.dart';
import 'package:qz_app/pages/xiangjiao.dart';

class NavPage extends StatelessWidget {
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
                    generateBtn('香蕉视频', Xiangjiao()),
                    generateBtn('茄子视频', Qiezi()),
                    generateBtn('测试下载', Qiezi()),
                  ]),
            )));
  }
}
