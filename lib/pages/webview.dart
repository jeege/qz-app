import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  final String url;
  CustomWebview({Key key, this.url}) : super(key: key);
  @override
  CustomWebviewState createState() => CustomWebviewState();
}

class CustomWebviewState extends State<CustomWebview> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  String title;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
     _controller.future.then((controller) async {
      String _title = await controller.getTitle();
      setState(() {
        title = _title;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: title,
        body: WebView(
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
