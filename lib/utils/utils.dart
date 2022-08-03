import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:qz_app/model/history.dart';
import 'package:qz_app/pages/webview.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

RegExp urlExp = new RegExp(r"^(?:(http(s)?\:)?\/\/)");

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> localFile(String fileName) async {
  final path = await localPath;
  return new File('$path/$fileName');
}

Future<Database> getDb(String dbName) async {
  final databasesPath = await getDatabasesPath();
  String path = join(databasesPath, '$dbName.db');
  Database db = await openDatabase(path);
  // await deleteDatabase(dbPath);
  print('-------------$db');
  return db;
}

Future<bool> isTableExits(Database db, String tableName) async {
  var res = await db.rawQuery(
      "select * from Sqlite_master where type = 'table' and name = '$tableName'");
  return res != null && res.length > 0;
}

Future getAllList(Database db, String tableName) async {
  print('开始获取------------');
  List<Map<String, dynamic>> maps =
      await db.rawQuery("select * from $tableName ORDER BY id DESC");
  print('获取完成------------');
  return maps;
}

Future insertHistory(Database db, HistoryItem item) async {
  return await db.rawInsert(
      "insert into history_table (id,imgUrl,movieUrl,title) values (?,?,?,?)",
      [item.id, item.imgUrl, item.movieUrl, item.title]);
}

Future delHistoryByTitle(Database db, String title) async {
  return await db.rawDelete("DELETE from history_table WHERE title=?", [title]);
}

Future isExitInHistory(Database db, String title) async {
  var exitItem =
      await db.rawQuery("select * from history_table WHERE title=?", [title]);
  if (exitItem.length == 1) {
    return true;
  }
  return false;
}

Future delHistory(Database db, int id) async {
  return await db.rawDelete("DELETE from history_table WHERE id=?", [id]);
}

const _chars = 'abcdefghijklmnopqrstuvwxyz';
String getRandomString(int length) {
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));
}

void goUrl(BuildContext context, String url) async {
  Uri _url = Uri.parse(url);
  if (url.contains('m3u8')) {
    if (!await launchUrlString('mttbrowser://url=$url')) throw '无法访问 $_url';
  } else {
    if (['http', 'https'].indexOf(_url.scheme) < 0) {
      try {
        if (!await launchUrl(_url)) throw '无法访问 $_url';
      } catch (e) {
        print('-----------出错了-----------${e.message}');
      }
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CustomWebview(url: url)));
    }
  }
}
