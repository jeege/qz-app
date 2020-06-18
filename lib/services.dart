import 'dart:convert';

import 'package:qz_app/config.dart';
import 'package:qz_app/model/cateRes.dart';
import 'package:qz_app/model/movieDetailRes.dart';
import 'package:qz_app/model/movieListRes.dart';
import 'package:qz_app/model/navRes.dart';
import 'package:qz_app/model/xjMovieDetailRes.dart';
import 'package:qz_app/model/xjMovieList.dart';
import 'package:qz_app/utils/httpUtil.dart';

import 'model/actorRes.dart';
import 'model/version.dart';

getNav(String type) async {
  dynamic res = await http.get('$api/nav/$type');
  return NavRes.fromJson(jsonDecode(res));
}

getCate(String type) async {
  dynamic res = await http.get('$api/cate/$type');
  return CateRes.fromJson(jsonDecode(res));
}

getActorList({int page, int size}) async {
  dynamic res = await http.post('$api/actor',
      data: {"account": "309c237b47b02268", "page": page, "num": size});
  return ActorRes.fromJson(jsonDecode(res));
}

getMoveList(Map<String, dynamic> data) async {
  Map<String, dynamic> _data = data;
  _data['account'] = '309c237b47b02268';
  dynamic res = await http.post('$api/movie', data: _data);
  return MovieListRes.fromJson(jsonDecode(res));
}

getMoveDetail(int mid) async {
  dynamic res = await http.post('$api/movie_detail', data: {
    "account": "309c237b47b02268",
    "m_id": mid,
  });
  return MovieDetailRes.fromJson(jsonDecode(res));
}

getXjList(data) async {
  dynamic res = await http.get(
      '$apiXj/vod/listing-${data['type']}-${data['area']}-${data['year']}-${data['qxd']}-${data['sku']}-0-${data['ma']}-${data['lan']}-${data['sort']}-${data['currentPage']}?apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
  if (res != null) {
    return XjMovieListRes.fromJson(jsonDecode(res));
  }
  return null;
}

getXjDetail(String id) async {
  dynamic res = await http.get(
      '$apiXj/vod/reqplay/$id?apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
  if (res != null) {
    return XjMovieDetailRes.fromJson(jsonDecode(res));
  }
  return null;
}


getVersion() async{
    dynamic res = await http.get('https://api.github.com/repos/Dajiege/qz-app/releases/latest', showError: false);
  if (res != null) {
    return Version.fromJson(jsonDecode(res));
  }
  return null;
}