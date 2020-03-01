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
      navList1 = generateBtnList(nav1.data, type: 1, propName: 'nav');
      navList2 = generateBtnList(nav2.data,  type: 2, propName: 'nav');
      cateList1 = generateBtnList(cate1.data.list,  type: 1, propName: 'cate');
      cateList2 = generateBtnList(cate2.data.list, type: 2, propName: 'cate');
    });
  }

  generateBtnList(data, {int type, String propName}) {
    return data.map<Widget>((item) {
      Map<String, dynamic> data = new Map<String, dynamic>();
          data['type'] = type;
          data[propName] = item.id;
          return generateBtn(item.name, data);
    }).toList();
  }

  Widget generateBtn(title,Map<String, dynamic>data){
    return MaterialButton(
        textColor: Colors.blue,
        minWidth: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.blue),
        ),
        onPressed: () {
          toListPage(title,data);
        },
        // child: Text(item.name),
        child: Text(title),
      );
  }

  toListPage(title,data){
    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ListPage(
                        title: title,
                        data: data
                      )));
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
                    titleText('综合导航：', top: 0.0),
                    spaceBetweenWrap([
                      generateBtn('全部',{}),
                      generateBtn('头条精选',{'jing': 1}),
                      generateBtn('热门AV',{'type': 1,'state': 2}),
                      generateBtn('热门短片',{'type': 2,'state': 2}),
                      generateBtn('最新AV',{'type': 1,'state': 1}),
                      generateBtn('最新短片',{'type': 2,'state': 1}),
                    ]),
                    titleText('AV导航：'),
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

  Widget titleText(String txt, {double fontSize = 16.0, double top = 10.0, double bottom = 8.0}) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: Text(txt, style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold)),
    );
  }