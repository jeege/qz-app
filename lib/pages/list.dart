import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/model/movieDetailRes.dart';
import 'package:qz_app/pages/video.dart';

import '../services.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title, this.data}) : super(key: key);
  final String title;
  final Map<String, dynamic> data;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  WidgetsBinding widgetsBinding = WidgetsBinding.instance; //监听widget渲染
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>(); //刷新的key绑定widget
  ScrollController _scrollController;
  bool isLoading = false; // 是否正在加载，防止多次请求加载下一页
  bool isFinished = false; // 是否加载完成

  int page = 0;
  int size = 20;

  List list = [];
  List<MovieUrl> mList = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    widgetsBinding.addPostFrameCallback((callback) {
      _refreshIndicatorKey.currentState.show();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  _init() async {
    Map<String, dynamic> data = widget.data;
    data['page'] = page;
    data['num'] = size;
    dynamic res = await getMoveList(data);
    setState(() {
      if (res.data.list.length > 0) {
        list = res.data.list;
        if (res.data.list.length < size) {
          isFinished = true;
        }
      } else {
        isFinished = true;
      }
      print('初始化------${list.length}');
    });
  }

  Future<Null> _loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      page++;
      Map<String, dynamic> data = widget.data;
      data['page'] = page;
      data['num'] = size;
      dynamic res = await getMoveList(data);
      setState(() {
        isLoading = false;
        if (res.data.list.length > 0) {
          list.addAll(res.data.list);
          if (res.data.list.length < size) {
            isFinished = true;
          }
        } else {
          isFinished = true;
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    // 这里不要忘了将监听移除
    _scrollController.dispose();
  }

  routeToDetail(item) async {
    dynamic res = await getMoveDetail(item.id);
    mList = res.data.movieUrl;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => VideoPage(
                title: res.data.movie.title,
                url: mList[1].url,
                sourList: mList)));
  }

  Widget generateListItem(item) {
    return GestureDetector(
        onTap: () {
          routeToDetail(item);
        },
        child: Row(children: [
          Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: item.img,
                placeholder: (context, url) =>
                    CircularProgressIndicator() /* 透明图片 */,
              )),
          Expanded(
            flex: 1,
            child: Column(children: [
              Text(item.title),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                children: <Widget>[
                  Text('好评数：${item.hot}'),
                  Text('好评率：${item.zanLv}%'),
                ],
              ),
            ]),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: widget.title,
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _handleRefresh,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index < list.length) {
                  return generateListItem(list[index]);
                } else {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(isFinished ? "到底了" : "加载中..."),
                    ),
                  );
                }
              },
              itemCount: list.length + 1,
            )));
  }

  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    page = 0;
    list = [];
    isFinished = false;
    _init();
  }
}
