import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = new HttpUtil();
    return instance;
  }

  HttpUtil() {
    options = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        responseType: ResponseType.plain);
    dio = new Dio(options);
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前-----$options");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('请求成功-------------$url');

      return response.data;
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);

      return response;
    }
  }

  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('请求成功-------------$url');

      return response.data;
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
      return response;
    }
  }

  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      return response.data;
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
      return response;
    }
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      Fluttertoast.showToast(
          msg: "连接超时",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      Fluttertoast.showToast(
          msg: "请求超时",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Fluttertoast.showToast(
          msg: "响应超时",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    } else if (e.type == DioErrorType.RESPONSE) {
      Fluttertoast.showToast(
          msg: "${e.error}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    } else if (e.type == DioErrorType.CANCEL) {
      Fluttertoast.showToast(
          msg: "请求取消",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "未知错误",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    }
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

HttpUtil http = new HttpUtil();
