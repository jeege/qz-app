import 'dart:io';

import 'package:dio/adapter.dart';
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

    // 忽略证书
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      return client;
    };

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("请求之前-----$options");
      // Do something before request is sent
      return handler.next(options); //continue
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("响应之前");
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      print("错误之前");
      // Do something with response error
      return handler.next(e); //continue
    }));
  }

  get(url, {data, options, cancelToken, showError = true}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('请求成功-------------$url');

      return response.data;
    } on DioError catch (e) {
      print('get error---------$e');
      if (showError) formatError(e);

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
    Fluttertoast.showToast(
        msg: "${e.error}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black54,
        textColor: Colors.white);
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

HttpUtil http = new HttpUtil();
