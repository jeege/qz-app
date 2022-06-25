import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/pages/searchlist.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  searchHandle(text) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => SearchList(keywords: text)));
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '搜索关键词',
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '请输入关键词...',
                ),
                onSubmitted: (text) {
                  searchHandle(text);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(children: [
                  Expanded(
                      child: RgButton('确定', onTap: () {
                    searchHandle(controller.text);
                  }, height: 50.0))
                ]),
              )
            ],
          ),
        ));
  }
}
