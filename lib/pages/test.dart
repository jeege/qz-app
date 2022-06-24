import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/model/history.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';
import '../config.dart';
import '../utils/cacheManage.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Database db;
  List map = [];
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    db = await getDb(dbName);
    List _map = await getAllList(db, 'history_table');
    setState(() {
      map = _map;
    });
  }

  @override
  void dispose() {
    super.dispose();
    db?.close();
  }


  delItem(id) async {
    final int flag = await delHistory(db, id);
    if (flag == 1) {
      Fluttertoast.showToast(
          msg: "删除成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
      List _map = await getAllList(db, 'history_table');
      setState(() {
        map = _map;
      });
    } else {
      Fluttertoast.showToast(
          msg: "删除失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    }
  }

  generateListItem(item) {
    return Container(
        margin: EdgeInsets.only(bottom: 8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 200.0,
              height: 120.0,
              decoration: new BoxDecoration(
                color: Color(0x1F000000),
              ),
              child: CachedNetworkImage(
                width: 200.0,
                height: 120.0,
                fit: BoxFit.cover,
                imageUrl: item.imgUrl,
                placeholder: (context, url) => Center(
                    child: Container(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(),
                )),
                cacheManager: EsoImageCacheManager()
                /* 透明图片 */,
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: 120.0,
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 14.0),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  goUrl(item.movieUrl);
                                },
                                child: Container(
                                  width: 50.0,
                                  child: Icon(
                                    Icons.open_in_browser,
                                    color: Color(0xFF000000),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  delItem(item.id);
                                },
                                child: Container(
                                  width: 50.0,
                                  child: Icon(
                                    Icons.delete,
                                    color: Color(0xFF000000),
                                  ),
                                )),
                          ],
                        ))
                      ]),
                    ]),
              ))
        ]));
  }

  List<Widget> generateList() {
    return map.map<Widget>((item) {
      return generateListItem(HistoryItem.fromJson(item));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '收藏记录',
        body: ListView(
          children: generateList(),
        ));
  }
}
