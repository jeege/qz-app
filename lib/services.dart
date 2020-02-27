import 'dart:convert';

import 'package:qz_app/config.dart';
import 'package:qz_app/model/navRes.dart';
import 'package:qz_app/utils/httpUtil.dart';

getNav(String type) async {
  dynamic res = await http.get('$api/nav/$type');
  return NavRes.fromJson(jsonDecode(res));
}
