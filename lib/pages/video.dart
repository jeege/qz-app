import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/model/movieDetailRes.dart';

class VideoPage extends StatefulWidget {
  final String title;
  final String url;
  final List<MovieUrl> sourList;
  VideoPage({this.title, this.url, this.sourList});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  IjkMediaController controller = IjkMediaController();
  // final key = GlobalKey<DefaultIJKControllerWidgetState>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    print('------------加载视频资源');
    await controller.setDataSource(DataSource.network(widget.url),
        autoPlay: true);
    // key.currentState.fullScreen();
    print('------------加载完成，开始播放');
    // await controller.play();
    // print('------------播放中');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: '学习视频',
    bgc: Colors.black, 
    body: Center(
      child: Container(
        decoration: BoxDecoration(),
        child: buildIjkPlayer())
    )
      );
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