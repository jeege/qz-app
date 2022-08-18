import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/model/videoListRes.dart';
import 'package:qz_app/pages/video.dart';
import 'package:qz_app/utils/utils.dart';

import '../components/rg_button.dart';

class VList extends StatefulWidget {
  final List<Data> data;

  VList({Key key, this.data}) : super(key: key);

  @override
  _VListState createState() => _VListState();
}

class _VListState extends State<VList> {
  @override
  void initState() {
    super.initState();
  }

  routeToDetail(item) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => VideoPage(
                    title: item.name,
                    img: null,
                    url: item.url)));
  }

  Widget _generateList(list) {
    return Wrap(
        children: List.generate(list.length, (index) {
      Eps item = list[index];
      return Container(
          margin: EdgeInsets.only(right: 12.0, bottom: 8.0),
          child: RgButton(
            item.name,
            onTap: () {
              routeToDetail(item);
            },
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '视频列表',
        body: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              Data item = widget.data[index];
              return Container(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            item.name,
                            style: TextStyle(fontSize: 18.0),
                          )),
                      _generateList(item.source.eps)
                    ],
                  ));
            }));
  }
}
