import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class VideoPage extends StatefulWidget {
  final String url;
  VideoPage({this.url = 'https://v2.xw0371.com/20180401/wiyCDyE3/index.m3u8'});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    controller.setNetworkDataSource(widget.url);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        buildIjkPlayer()
      ]),
    );
  }

  Widget buildIjkPlayer() {
    return AspectRatio (
      aspectRatio: 1.6, // 这里随意
      child: IjkPlayer(
        mediaController: controller,
      ),
    );
  }
}
