import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/title_text.dart';
import 'package:qz_app/model/history.dart';
import 'package:qz_app/model/movieDetailRes.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';
import '../config.dart';

class VideoPage extends StatefulWidget {
  final String from;
  final String title;
  final String img;
  final String url;
  final List<MovieUrl> sourList;
  VideoPage({this.from, this.title, this.img, this.url, this.sourList});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Database db;
  bool hasLoved = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    db = await getDb(dbName);
    bool _hasLoved = await isExitInHistory(db, widget.title);
    print('-----是否收藏$_hasLoved');
    setState(() {
      hasLoved = _hasLoved;
    });
  }

  loveHandle() async {
    if (hasLoved) {
      await delHistoryByTitle(db, widget.title);
      setState(() {
        hasLoved = false;
      });
    } else {
      await insertHistory(
          db,
          HistoryItem(
              id: new DateTime.now().millisecondsSinceEpoch,
              imgUrl: widget.img,
              movieUrl: widget.url,
              title: widget.title));

      setState(() {
        hasLoved = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '学习视频',
        bgc: Colors.black,
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              buildIjkPlayer(),
              Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(children: [
                    Expanded(
                        child: titleText(widget.title,
                            top: 0.0, bottom: 0.0, color: Color(0xFFFFFFFF))),
                    GestureDetector(
                        onTap: () {
                          goUrl(context, widget.url);
                        },
                        child: Container(
                          width: 40.0,
                          child: Icon(
                            Icons.open_in_browser,
                            color: Color(0xFFFFFFFF),
                          ),
                        )),
                    GestureDetector(
                        onTap: loveHandle,
                        child: Container(
                          width: 40.0,
                          child: Icon(
                            hasLoved ? Icons.favorite : Icons.favorite_border,
                            color: Color(0xFFFFFFFF),
                          ),
                        )),
                  ]))
            ])));
  }

  Widget buildIjkPlayer() {
    return AspectRatio(aspectRatio: 1280 / 720, child: null);
  }
}
