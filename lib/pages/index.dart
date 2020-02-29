import 'package:flutter/material.dart';

import 'package:qz_app/components/layout.dart';
import 'package:qz_app/pages/list.dart';
import 'package:qz_app/services.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  dynamic nav1;
  dynamic nav2;
  dynamic cate1;
  dynamic cate2;
  List<Widget> navList1 = [];
  List<Widget> navList2 = [];
  List<Widget> cateList1 = [];
  List<Widget> cateList2 = [];

  _init() async {
    nav1 = await getNav('1');
    nav2 = await getNav('2');
    cate1 = await getCate('1');
    cate2 = await getCate('2');
    setState(() {
      navList1 = toList(nav1.data, type: 1, propName: 'nav');
      navList2 = toList(nav2.data,  type: 2, propName: 'nav');
      cateList1 = toList(cate1.data.list,  type: 1, propName: 'cate');
      cateList2 = toList(cate2.data.list, type: 2, propName: 'cate');
    });
  }

  toList(data, {int type, String propName}) {
    return data.map<Widget>((item) {
      return MaterialButton(
        textColor: Colors.blue,
        minWidth: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.blue),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ListPage(
                        // title: item.name,
                        title: '视频',
                        type: type,
                        propName: propName,
                        id: item.id
                      )));
        },
        // child: Text(item.name),
        child: Text('视频'),
      );
    }).toList();
  }

  Widget titleText(String txt, {double top = 10.0, double bottom = 8.0}) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: Text(txt, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
    );
  }

  Widget spaceBetweenWrap(List<Widget> children){
    return Wrap(
      spacing: 10.0,
      children: children
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '首页',
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    titleText('AV导航：', top: 0.0),
                    spaceBetweenWrap(navList1),
                    titleText('短片导航：'),
                    spaceBetweenWrap(navList2),
                    titleText('AV分类：'),
                    spaceBetweenWrap(cateList1),
                    titleText('短片分类：'),
                    spaceBetweenWrap(cateList2),
                  ],
                ))));
  }
}
