import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qz_app/model/videoListRes.dart';
import 'package:qz_app/pages/vlist.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services.dart';

class CustomWebview extends StatefulWidget {
  final String url;
  CustomWebview({Key key, this.url}) : super(key: key);
  @override
  CustomWebviewState createState() => CustomWebviewState();
}

class CustomWebviewState extends State<CustomWebview> {
  String title = '';
  bool showVideoBtn = false;
  WebViewController controller;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  renderTitle() async {
    String _title = await controller.getTitle();
    String isVideoPage = await controller.runJavascriptReturningResult(
        '(function(){return /(play)|(v_.*\.html)/.test(window.location.href)})();');
    setState(() {
      title = _title;
      showVideoBtn = isVideoPage == 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: new Icon(Icons.close)),
            showVideoBtn
                ? IconButton(
                    onPressed: () async {
                      VideoList res =
                          await getVideoList(await controller.currentUrl());
                      print(res);
                      if (res != null && res.data != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VList(data: res.data)));
                      } else {
                        Fluttertoast.showToast(
                            msg: "没有找到视频数据",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white);
                      }
                    },
                    icon: new Icon(Icons.play_arrow))
                : Container()
          ],
        ),
        backgroundColor: Colors.white,
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
          },
          navigationDelegate: (NavigationRequest request) {
            print('拦截webview请求：${request.url}');
            Uri u = Uri.parse(request.url);
            if (['http', 'https'].indexOf(u.scheme) < 0) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageFinished: (url) {
            renderTitle();
          },
        ),
        floatingActionButton: null,
      ),
    );
  }
}
