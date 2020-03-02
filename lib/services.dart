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

getNav(String type) async {
  dynamic res = await http.get('$api/nav/$type');
  return NavRes.fromJson(jsonDecode(res));
}

getCate(String type) async {
  dynamic res = await http.get('$api/cate/$type');
  return CateRes.fromJson(jsonDecode(res));
}

getActorList({int page, int size}) async {
  dynamic res = await http.post('$api/actor',data:{"account": "309c237b47b02268", "page": page, "num":size});
  return ActorRes.fromJson(jsonDecode(res));
}

getMoveList(Map<String, dynamic> data) async {
  Map<String, dynamic> _data = data;
  _data['account'] = '309c237b47b02268';
  dynamic res = await http.post('$api/movie',data:_data);
  return MovieListRes.fromJson(jsonDecode(res));
}

getMoveDetail(int mid) async {
  dynamic res = await http.post('$api/movie_detail',data:{
    "account": "309c237b47b02268", 
    "m_id": mid,
  });
  return MovieDetailRes.fromJson(jsonDecode(res));
}

getXjList({String type = '0',String area = '0',String year = '0',String qxd = '0',String sku = '0',String vip = '0',String ma = '0',String lan = '0',String sort = '0',String currentPage,}) async {
  dynamic res = await http.get('$apiXj/vod/listing-$type-$area-$year-$qxd-$sku-$vip-$ma-$lan-$sort-$currentPage?apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
  return XjMovieListRes.fromJson(jsonDecode(res));
}

getXjDetail(String id) async {
  dynamic res = await http.get('$apiXj/vod/reqplay/$id?apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
  return XjMovieDetailRes.fromJson(jsonDecode(res));
}