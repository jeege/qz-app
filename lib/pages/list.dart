import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';

import '../services.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title, this.type, this.propName, this.id})
      : super(key: key);
  final String title;
  final int type;
  final String propName;
  final int id;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int page = 0;
  int size = 20;

  dynamic res;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    print('发起请求');
    dynamic data = {'page': 0, 'size': 10, 'type': widget.type, widget.propName: widget.id};
    res = await getMoveList(data);
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: widget.title, body: ListView(children: [Text('列表页')]));
  }
}
