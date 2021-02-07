import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:url_launcher/url_launcher.dart';

class VipVideo extends StatefulWidget {
  @override
  _VipVideoState createState() => _VipVideoState();
}

class _VipVideoState extends State<VipVideo> with WidgetsBindingObserver {
  TextEditingController controller;
  String videoUrl;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  getClipboardData() async {
    ClipboardData clipboardData = await Clipboard.getData('text/plain');
    if(clipboardData != null) {
      controller.text = clipboardData.text;
      _askedToLead();
    }
  }

  Future<void> _askedToLead() async {
    showDialog<int>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('提示'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('发现复制的链接，是否跳转到解析该链接？'),
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
            goUrl();
          }
        });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      getClipboardData();
    }
  }


  
  goUrl() async {
    videoUrl = 'https://api.mvm.link/?url=${controller.text}';
    if (await canLaunch(videoUrl)) {
      await launch(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '首页',
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '请输入视频链接地址...',
                  ),
                  onSubmitted: (text) {
                    goUrl();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(children: [
                    Expanded(child: RgButton('去看看', onTap: goUrl, height: 50.0))
                  ]),
                )
              ],
            )));
  }
}
