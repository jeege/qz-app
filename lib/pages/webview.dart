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
  String currentUrl = '';
  WebViewController controller;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
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
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          if (Navigator.canPop(context)) {
            return IconButton(
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  } else {
                    Navigator.maybePop(context);
                  }
                },
                icon: const Icon(Icons.arrow_back));
          }
          return null;
        }),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                goUrl(context, '$vip$currentUrl');
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
          Uri u = Uri.parse(request.url);
          if (['http', 'https'].indexOf(u.scheme) < 0) {
            goUrl(context, request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageFinished: (url) {
          currentUrl = url;
          renderTitle();
        },
      ),
      floatingActionButton: null,
    );
  }
}
