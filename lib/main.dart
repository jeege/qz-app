import 'package:flutter/material.dart';
import 'package:qz_app/pages/auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qz_app/utils/chineseCupertinoLocalizations.dart';

import 'config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getApiUrl();
    return MaterialApp(
      title: '测试',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
    );
  }
}
