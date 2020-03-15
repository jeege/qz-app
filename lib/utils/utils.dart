import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:qz_app/model/history.dart';
import 'package:sqflite/sqflite.dart';

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
   return  await db.rawDelete("DELETE from history_table WHERE title=?",[title]);
}

Future isExitInHistory(Database db, String title) async {
  var exitItem = await db
      .rawQuery("select * from history_table WHERE title=?",[title]);
  if (exitItem.length == 1) {
    return true;
  }
  return false;
}

Future delHistory(Database db, int id) async {
  return await db.rawDelete("DELETE from history_table WHERE id=?", [id]);
}
