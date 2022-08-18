import 'dart:convert';

import 'package:qz_app/config.dart';
import 'package:qz_app/model/apiRes.dart';
import 'package:qz_app/model/videoListRes.dart';
import 'package:qz_app/model/xjMovieDetailRes.dart';
import 'package:qz_app/model/xjMovieList.dart';
import 'package:qz_app/utils/httpUtil.dart';

import 'model/version.dart';


getXjList(data) async {
  dynamic res = await http.get(
      '$apiXj/vod/listing-${data['type']}-${data['area']}-${data['year']}-${data['qxd']}-${data['sku']}-0-${data['ma']}-${data['lan']}-${data['sort']}-${data['currentPage']}?apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
  if (res != null) {
    return XjMovieListRes.fromJson(jsonDecode(res));
  }
  return null;
}

getXjSearchList(String keyword, int page) async {
  dynamic res = await http.get(
      '$apiXj/search?wd=$keyword&page=$page&apiVersion=28&deviceModel=MI%209&brand=Xiaomi&deviceName=cepheus&serial=72a353b0&platform=android&version=3.5.1&_t=${new DateTime.now().millisecondsSinceEpoch}');
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

getVersion() async {
  dynamic res = await http.get(
      'https://api.github.com/repos/Dajiege/qz-app/releases/latest',
      showError: false);
  if (res != null) {
    return Version.fromJson(jsonDecode(res));
  }
  return null;
}

getApi() async {
  dynamic res = await http.get(
      'https://cdn.jsdelivr.net/gh/jeege/qz-app@master/url.json',
      showError: false);
  if (res != null) {
    return ApiRes.fromJson(jsonDecode(res));
  }
  return null;
}

Future<VideoList> getVideoList(String url) async {
  dynamic res = await http.get('https://mail-lime.vercel.app/api/vip?url=${Uri.encodeComponent(url)}',
      showError: false);
  if (res != null) {
    return VideoList.fromJson(jsonDecode(res));
  }
  return null;
}