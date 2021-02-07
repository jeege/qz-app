import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/utils/utils.dart';
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
      if(urlExp.hasMatch(clipboardData.text)) {
        _askedToLead(clipboardData.text);
      }
    }
  }

  void _askedToLead(str) {
     showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('发现复制的链接:\n\n$str\n\n是否解析该链接', style: TextStyle(
            fontSize: 16.0
          )),
          children: <Widget>[
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                new FlatButton(
                  child: new Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop(0);
                  },
                ),
                new FlatButton(
                  child: new Text('确定'),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop(1);
                  },
                ),
              ],),
            )
          ],
        );
      }
    ).then((val) {
      if (val == 1) {
        goUrl(str);
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


  
  goUrl(str) async {
    videoUrl = 'https://api.mvm.link/?url=$str';
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
                    goUrl(text);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(children: [
                    Expanded(child: RgButton('去看看', onTap: () => {
                      goUrl(controller.text)
                    }, height: 50.0))
                  ]),
                )
              ],
            )));
  }
}
