import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/pages/nav.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  submit() {
    if(controller.text == '6666'){
      Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => NavPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '首页',
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '请输入...',
                  ),
                  onSubmitted: (text) {
                    if(text == '6666'){
                      Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => NavPage()));
                    }
      },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(
                  children: [
                    Expanded(child: 
                RgButton('确认',
                onTap: submit,
                height: 50.0
                ))
                  ]
                ),)
                
              ],
            )));
  }
}
