import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/pages/video.dart';
import 'package:qz_app/utils/cacheManage.dart';

import '../services.dart';

class SearchList extends StatefulWidget {
  SearchList({Key key, this.keywords}) : super(key: key);

  final String keywords;

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  WidgetsBinding widgetsBinding = WidgetsBinding.instance; //监听widget渲染
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>(); //刷新的key绑定widget
  ScrollController _scrollController;
  bool isLoading = false; // 是否正在加载，防止多次请求加载下一页
  bool isFinished = false; // 是否加载完成

  int page = 1;
  int total = 0;

  List list = [];
  String url = '';

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
    String keywords = widget.keywords;
    dynamic res = await getXjSearchList(keywords, page);
    while (res == null) {
      res = await getXjSearchList(keywords, page);
    }
    setState(() {
      if (res.data.vodrows.length > 0) {
        list = res.data.vodrows;
        total = res.data.pageinfo.total;
        if (list.length == total) {
          isFinished = true;
        }
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
      String keywords = widget.keywords;
      dynamic res = await getXjSearchList(keywords, page);
      while (res == null) {
        res = await getXjSearchList(keywords, page);
      }
      setState(() {
        isLoading = false;
        if (res.data.vodrows.length > 0) {
          list.addAll(res.data.vodrows);
          if (list.length == total) {
            isFinished = true;
          }
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
    dynamic res = await getXjDetail(item.vodid);
    if (res != null) {
      url = res.data.httpurl ?? res.data.httpurlPreview;
      if (url != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => VideoPage(
                    from: 'xiangjiao',
                    title: item.title,
                    img: item.coverpic.replaceAll('https', 'http'),
                    url: url)));
      } else {
        Fluttertoast.showToast(
            msg: "视频链接不存在，请重试",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            textColor: Colors.white);
      }
    }
  }

  Widget generateListItem(item) {
    return GestureDetector(
        onTap: () {
          routeToDetail(item);
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: 200.0,
                  height: 120.0,
                  decoration: new BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: CachedNetworkImage(
                    width: 200.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                    imageUrl: item.coverpic,
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
                                Text(
                                  '评分：${item.scorenum}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  '赞：${item.upnum}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  '点击：${item.playcountTotal}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ))
                          ]),
                        ]),
                  ))
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '搜索结果',
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
    page = 1;
    list = [];
    isFinished = false;
    _init();
  }
}
