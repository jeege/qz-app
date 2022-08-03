import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qz_app/config.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  final String url;
  CustomWebview({Key key, this.url}) : super(key: key);
  @override
  CustomWebviewState createState() => CustomWebviewState();
}

class CustomWebviewState extends State<CustomWebview> {
  String title = '';
  WebViewController controller;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  renderTitle() async {
    String _title = await controller.getTitle();
    setState(() {
      title = _title;
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
                onPressed: () async {
                  goUrl(context, '$vip${await controller.currentUrl()}');
                },
                icon: new Icon(Icons.play_arrow))
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
