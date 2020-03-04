import 'package:flutter/material.dart';

import 'package:qz_app/components/layout.dart';
import 'package:qz_app/components/rg_button.dart';
import 'package:qz_app/components/title_text.dart';
import 'package:qz_app/pages/list.dart';
import 'package:qz_app/services.dart';

class Xiangjiao extends StatefulWidget {
  @override
  _XiangjiaoState createState() => _XiangjiaoState();
}

class _XiangjiaoState extends State<Xiangjiao> {
  Map<String, String> searchData = {
    'type': '0',
    'area': '0',
    'year': '0',
    'qxd': '0',
    'sku': '0',
    'vip': '0',
    'ma': '0',
    'lan': '0',
    'sort': '0',
  };

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {}

  Widget generateBtn(title, value, propsName) {
    return RgButton(
      title,
      color: searchData[propsName] == value ? Colors.white : Colors.blue,
      bgColor: searchData[propsName] == value ? Colors.blue : null,
      onTap: () {
        setState(() {
          searchData[propsName] = value;
        });
        print(searchData);
      },
    );
  }
  genetateGroup(propName,list){
    return list.map<Widget>((item) => generateBtn(item[0], item[1], propName)).toList();
  }

  Widget radioBox(txt, propName,list) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child:Row(children: [
      Container(margin: EdgeInsets.only(right: 15.0), child: titleText(txt)),
      Expanded(flex: 1, child: Wrap(spacing: 10.0, children: genetateGroup(propName,list)))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '香蕉视频',
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    radioBox('类型筛选:', 'type', [
                      ['全部类型', '0'],
                      ['偷拍自拍', '4'],
                      ['制服诱惑', '5'],
                      ['清纯少女', '6'],
                      ['辣妹大奶', '7'],
                      ['女同专属', '8'],
                      ['素人出演', '9'],
                      ['角色扮演', '10'],
                      ['成人动漫', '11'],
                      ['人妻熟女', '12'],
                      ['变态另类', '13'],
                      ['经典伦理', '14'],
                    ]),
                    radioBox('地区筛选:', 'area', [
                      ['全部地区','0'],
                      ['国产','2'],
                      ['日本','3'],
                      ['台湾','8'],
                      ['韩国','5'],
                      ['香港','7'],
                      ['欧美','6'],
                    ]),
                  ],
                ))));
  }
}
