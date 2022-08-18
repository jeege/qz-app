import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:qz_app/config.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final FijkPlayer player = FijkPlayer();
  int _current = 0;
  ScrollController _scrollController;
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await player.setOption(FijkOption.hostCategory, "request-screen-on", 1);
    playChannel(channelList[_current]);
  }

  playChannel(item) async {
    await player.reset();
    await player.setDataSource(item['url'], autoPlay: true);
  }

  Widget channelButton(index) {
    Map<String, dynamic> item = channelList[index];
    return TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _current = index;
          });
          playChannel(item);
        },
        child: Text(
          item['name'],
          style: TextStyle(
              color: _current == index ? Colors.red : Colors.blueGrey),
        ));
  }

  _drawerChangeHandle(e) {
    if (e) {
      setState(() {
        _scrollController =
            ScrollController(initialScrollOffset: _scrollPosition);
      });
    } else {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true, title: Text('在线直播'), leading: BackButton()),
        backgroundColor: Colors.black,
        endDrawer: Drawer(
          width: 220.0,
          child: ListView.separated(
              controller: _scrollController,
              itemCount: channelList.length,
              itemBuilder: (context, index) {
                return channelButton(index);
              },
              separatorBuilder: (context, index) {
                return Divider(
                    thickness: 1, height: 0, color: Colors.grey[350]);
              }),
        ),
        onEndDrawerChanged: _drawerChangeHandle,
        body: Center(
          child: FijkView(
            player: player,
            color: Colors.black,
          ),
        ));
  }
}
