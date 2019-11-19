import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_netease_cloud_music/model/album.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/mv.dart';
import 'package:flutter_netease_cloud_music/model/recommend.dart';
import 'package:flutter_netease_cloud_music/model/user.dart';
import 'package:flutter_netease_cloud_music/model/banner.dart' as mBanner;
import 'package:flutter_netease_cloud_music/model/banner_model_entity.dart';
import 'package:flutter_netease_cloud_music/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_loading.dart';

class NetUtils {
  static Dio _dio;

  static void init() async {
    // 获取沙盒路径，用于存储 cookie
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.153:3000'))
      ..interceptors.add(CookieManager(cj))
      ..interceptors.add(LogInterceptor(
          request: true,
          requestBody: false,
          requestHeader: false,
          responseHeader: false,
          responseBody: true));
  }

  static Future<Response> _get(BuildContext context, String url,
      {Map<String, dynamic> params}) async {
    Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      if (e.response is Map) {
        return Future.value(e.response);
      } else {
        return Future.error(0);
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  /// 登录
  static Future<User> login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login/cellphone', params: {
      'phone': phone,
      'password': password,
    });

    return User.fromJson(response.data);
  }

  static Future<Response> refreshLogin(BuildContext context) async {
    return await _get(context, '/login/refresh').catchError((e) {
      Utils.showToast('网络错误！');
    });
  }

  //首页Banner
//  static Future<mBanner.Banner> getBannerData(BuildContext context) async {
//    var response = await _get(context, '/banner', params: {'type': 1});
//    print("response = " + response.toString());
//    return mBanner.Banner.fromJson(response.data);
//  }
  static Future<BannersList> getBannerData(BuildContext context) async {
    var response = await _get(context, '/banner', params: {'type': 1});
    return BannersList.fromJson(response.data);
  }

  static Future<RecommendData> getRecommendData(BuildContext context) async {
    var response = await _get(context, '/recommend/resource');
    return RecommendData.fromJson(response.data);
  }

  static Future<AlbumData> getAlbumData(
    BuildContext context, {
    Map<String, dynamic> params = const {'offset': 1, 'limit': 10},
  }) async {
    var response = await _get(context, '/top/album', params: params);
    return AlbumData.fromJson(response.data);
  }

  static Future<MVData> getMVData(
    BuildContext context, {
    Map<String, dynamic> params = const {'offset': 1, 'limit': 10},
  }) async {
    var response = await _get(context, '/top/mv', params: params);
    return MVData.fromJson(response.data);
  }
  /// 每日推荐歌曲
  static Future<DailySongsData> getDailySongsData(BuildContext context) async {
    var response = await _get(context, '/recommend/songs');
    return DailySongsData.fromJson(response.data);
  }
}
