import 'package:dio/dio.dart';
import 'dart:collection';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_book/App/user_manager.dart';
//import 'app_cache_manager.dart';
import 'http_code.dart';
import 'http_response.dart';
import '../config/config.dart';

// 使用实例
// ///获取最新一天的数据
//   static getTodayData() async {
//     HttpResponse response = await HttpManager.fetch(API_TODAY);
//     return response.data;
//   }

//   ///获取指定日期的数据 [date:指定日期]
//   static getSpecialDayData(String date) async {
//     HttpResponse response =
//         await HttpManager.fetch(API_SPECIAL_DAY + date.replaceAll("-", "/"));
//     return response.data;
//   }

class HttpManager {
  static Dio dio = Dio();
  static Future<HttpResponse> fetch(url,
      {noTip = false,
      dynamic params,
      Map<String, String> header,
        method = 'get',
        checkToken = false}) async {
    ///构造Headers
    Map<String, String> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    Options option = Options(method: method);
    option.headers = headers;
    option.connectTimeout = 15000;
    option.responseType = ResponseType.json;
    Response response;

    // 增加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 为每个请求头都增加 user-agent
      options.headers["user-agent"] = "Custom-UA";
      options.headers["Content-Type"] = "application/json";
      // 检查是否有 token，没有则直接报错
      if (checkToken) {
        String token = await UserManager().getUserToken();
        options.headers["Authorization-Token"] = token;
        if (options.headers['Authorization-Token'] == null) {
          return HttpResponse(
              Code.errorHandleFunction(Code.NETWORK_ERROR, "token失效", noTip),
              false,
              Code.NETWORK_ERROR);
        }
      }

      // 检查缓存是否有数据
      // if (options.uri == Uri.parse('http://xxx.com/file1')) {
      //   return dio.resolve(" 返回缓存数据 ");
      // }
      // 放行请求
      return options;
    }));

//    await CacheManager.init();
    //取缓存
//    var cacheData = await CacheManager.get(url);
    // 检测网络状态
    var connectivityResult = await (Connectivity().checkConnectivity());
    //没有网络
    if (connectivityResult == ConnectivityResult.none) {
//      ///如果缓存不为空且接口可以缓存，那么直接从缓存取即可.
//      if (cacheData != null && !CacheManager.ignoreUrl(url)) {
//        if (AppConfig.DEBUG) {
//          print('httpManager=====>【缓存】cache请求url: ' + url);
//          print('httpManager=====>【缓存】返回结果: ' + cacheData.toString());
//        }
//        return HttpResponse(cacheData, true, Code.SUCCESS, headers: null);
//      } else {
//        return HttpResponse(
//            Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
//            false,
//            Code.NETWORK_ERROR);
//      }
      return HttpResponse(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
          false,
          Code.NETWORK_ERROR);
    }

    ///否则网络获取接口数据.
    try {
      response = await dio.request(url, data: params, options: option);
//      await CacheManager.set(CacheObject(url: url, value: response.data));
    } on DioError catch (e) {
      ///如果缓存不为空且接口可以缓存，那么直接从缓存取即可.
//      if (cacheData != null && !CacheManager.ignoreUrl(url)) {
//        if (AppConfig.DEBUG) {
//          print('httpManager=====>【缓存】cache请求url: ' + url);
//          print('httpManager=====>【缓存】请求头: ' + option.headers.toString());
//          if (params != null) {
//            print('httpManager=====>【缓存】请求参数: ' + params.toString());
//          }
//          if (response != null) {
//            print('httpManager=====>【缓存】返回结果: ' + cacheData.toString());
//          }
//        }
//        return HttpResponse(cacheData, true, Code.SUCCESS, headers: null);
//      }
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (AppConfig.DEBUG) {
        print('httpManager=====>请求异常: ' + e.toString());
        print('httpManager=====>请求异常url: ' + url);
      }
      return HttpResponse(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    if (AppConfig.DEBUG) {
      print('httpManager=====>请求url: ' + url);
      // print('httpManager=====>请求头: ' + option.headers.toString());
      if (params != null) {
        print('httpManager=====>请求参数: ' + params.toString());
      }
      if (response != null) {
//        print('httpManager=====>返回数据: ' + response.toString());
      }
    }

    ///返回正确获取到的网络数据.
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
//         print('success :' + response.data['success']);
        // if (response.data['data']['success']) {
        //   print('success :' + response.data.data.toString());
        // }
//        print('httpManager=====>返回数据: ' + response.data.toString());
        return HttpResponse(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      ///错误处理
      return HttpResponse(response.data, false, response.statusCode,
          headers: response.headers);
    }

    ///容错处理
    return HttpResponse(
        Code.errorHandleFunction(response.statusCode, "", noTip),
        false,
        response.statusCode);
  }
}
