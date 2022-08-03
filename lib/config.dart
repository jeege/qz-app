import 'dart:async';

import 'package:qz_app/services.dart';
import 'package:qz_app/utils/utils.dart';

String vip = 'https://z1.m1907.cn/?jx=';
String api = 'https://api-qn.ccsxhd.com';
// final String apiXj = 'https://103.219.176.60';
String apiXj = 'https://${getRandomString(10)}.xiangxiangapps.com';

Future getApiUrl() async {
  dynamic res = await getApi();
  // vip = res.vip;
  apiXj = res.xjApi;
}

const String dbName = 'test';
const String createHistoryTable = '''
        CREATE TABLE history_table (
            id INTEGER PRIMARY KEY, 
            imgUrl TEXT, 
            movieUrl TEXT, 
            title TEXT)
          ''';
