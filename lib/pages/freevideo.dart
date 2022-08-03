import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/pages/webview.dart';

class FreeVideo extends StatefulWidget {
  FreeVideo({Key key}) : super(key: key);

  @override
  State<FreeVideo> createState() => _FreeVideoState();
}

class _FreeVideoState extends State<FreeVideo> {
  Widget generateVideoPlatform(String img, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomWebview(url: url)));
      },
      child: Container(
          width: 100,
          height: 100,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.network(img)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '看视频',
        body: Container(
            padding: EdgeInsets.only(top: 60.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    generateVideoPlatform(
                        'https://vfiles.gtimg.cn/vupload/20210415/6407271618491171592.png',
                        'https://m.v.qq.com/index.html'),
                    generateVideoPlatform(
                        'https://pic2.iqiyipic.com/common/20210423/9d1faebfa39d4d5db519f7e17de2c139.png',
                        'https://m.iqiyi.com/'),
                    generateVideoPlatform(
                        'https://is4-ssl.mzstatic.com/image/thumb/Purple112/v4/2e/80/4d/2e804da1-32f8-cf69-5360-08cc61aea216/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp',
                        'https://m.bilibili.com/'),
                  ]),
            )));
  }
}
