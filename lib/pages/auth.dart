import 'package:flutter/material.dart';
import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/pages/nav.dart';
import 'package:qz_app/utils/utils.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController controller;
  String psd;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    getPsd();
  }

  getPsd() async {
    try {
      final file = await localFile('psd.txt');
      String _psd = await file.readAsString();
      setState(() {
        psd = _psd;
      });
    } catch (e) {
      return null;
    }
  }

  submit() {
    checkPsd(controller.text);
  }

  checkPsd(String txt) async {
    if(psd == null ) {
      if(txt != ''){
      final file = await localFile('psd.txt');
      file.writeAsString('$txt');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => NavPage()));
          }
    } else if(txt == psd){
      Navigator.pushReplacement(context,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: psd == null ?'初始化登录密码...':'请输入...',
                  ),
                  onSubmitted: (text) {
                    checkPsd(text);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(children: [
                    Expanded(child: RgButton('确认', onTap: submit, height: 50.0))
                  ]),
                )
              ],
            )));
  }
}
