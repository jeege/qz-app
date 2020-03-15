import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/title_text.dart';
import 'package:qz_app/model/history.dart';
import 'package:qz_app/model/movieDetailRes.dart';
import 'package:qz_app/utils/utils.dart';
import 'package:screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sqflite/sqlite_api.dart';

import '../config.dart';

class VideoPage extends StatefulWidget {
  final String title;
  final String img;
  final String url;
  final List<MovieUrl> sourList;
  VideoPage({this.title, this.img, this.url, this.sourList});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Database db;
  bool hasLoved = false;
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    Screen.keepOn(true);
    _init();
  }

  void _init() async {
    db = await getDb(dbName);
    bool _hasLoved = await isExitInHistory(db, widget.title);
    print('-----是否收藏$_hasLoved');
    setState(() {
      hasLoved = _hasLoved;
    });
    print('------------加载视频资源');
    await controller.setDataSource(DataSource.network(widget.url),
        autoPlay: true);
    // key.currentState.fullScreen();
    print('------------加载完成，开始播放');
    // await controller.play();
    // print('------------播放中');
  }

  launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
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
    controller.dispose();
    Screen.keepOn(false);
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
                        onTap: launchURL,
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
    return AspectRatio(
      aspectRatio: 1280 / 720,
      child: IjkPlayer(
        mediaController: controller,
        controllerWidgetBuilder: (ctl) => DefaultIJKControllerWidget(
          controller: ctl,
          // key: key,
        ),
      ),
    );
  }
}
