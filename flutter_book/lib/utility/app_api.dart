import 'package:dio/dio.dart';
import 'package:flutter_book/config/config.dart';

import 'http_manager.dart';
import 'http_response.dart';

class AppAPI {
  /// api urls.
  static String API_ABOOK_HOST = AppConfig
      .apiHost; //'http://novel-api.test.harmight.com:8081';//''http://39.96.26.224:8081'; //正式环境
  static String API_HOME_BANNER = "$API_ABOOK_HOST/home/banner"; //banner GET
  static String API_HOME_MOD = "$API_ABOOK_HOST/home/mod";
  static String API_LOGIN = "$API_ABOOK_HOST/login";
  static String API_QUICK_LOGIN = "$API_ABOOK_HOST/quickLogin";
  static String API_CAPTCHA = "$API_ABOOK_HOST/captcha";
  static String API_PROFILE_EDIT = "$API_ABOOK_HOST/user/profile/edit";

  //游客登录
  // static postLoginTmp() async {
  //   // FormData formData = FormData.from({
  //   //   'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44',
  //   // });
  //   // var headers =  {'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44','platform': 'IOS', 'version': 11.0};
  //   // option.headers = headers;
  //   HttpResponse response = await HttpManager.fetch(API_LOGIN_TEMP,header: {'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44'}, method: 'post');
  //   return response.data;
  // }

  static getLiveHot() async {
    Map<String, String> params = {
      'app_version': "3.1.0",
      'app_channel': "appStore",
      'app_os': "IOS",
      'type': "1",
      'device_id': "B398BC27-9981-4A6F-A455-9A405B945DD6"
    };
    // option.headers = headers;
    HttpResponse response =
        await HttpManager.fetch(API_ABOOK_HOST, params: params, method: 'post');
    return response.data;
  }

  static getHomeBanner() async {
    //  Map<String, String> params = {
    //    	'app_version' :"3.1.0",
    //     'app_channel' : "appStore",
    //     'app_os' : "IOS",
    //     'type' : "1",
    //     'device_id' : "B398BC27-9981-4A6F-A455-9A405B945DD6"
    //  };
    // option.headers = headers;
    HttpResponse response = await HttpManager.fetch(API_HOME_BANNER);
    return response.data;
  }

  static getHomeMod() async {
    HttpResponse response = await HttpManager.fetch(API_HOME_MOD);
    return response.data;
  }

  //
  static postLogin(String username, String passWord) async {
    FormData formData =
        FormData.from({"username": username, "password": passWord});
//   String url = API_DATA + category + "/$count/$page";
    HttpResponse response =
        await HttpManager.fetch(API_LOGIN, params: formData, method: 'post');
    return response.data;
  }

  static postQuickLogin(String phone, String captcha) async {
    Map params = {"phone": phone, "captcha": captcha};
//   String url = API_DATA + category + "/$count/$page";
    HttpResponse response = await HttpManager.fetch(API_QUICK_LOGIN,
        params: params, method: 'post');
    return response.data;
  }

  static getCaptcha(String phone) async {
    String url = API_CAPTCHA + '?phone=' + "$phone";
    HttpResponse response = await HttpManager.fetch(url);
    return response.data;
  }

  static postUserProfile(Map params) async {
    HttpResponse response = await HttpManager.fetch(API_PROFILE_EDIT,
        params: params, method: 'post', checkToken: true);
    return response.data;
  }


// ///获取最新一天的数据
// static getTodayData() async {
//   HttpResponse response = await HttpManager.fetch(API_TODAY);
//   return response.data;
// }

// ///获取指定日期的数据 [date:指定日期]
// static getSpecialDayData(String date) async {
//   HttpResponse response =
//       await HttpManager.fetch(API_SPECIAL_DAY + date.replaceAll("-", "/"));
//   return response.data;
// }

// ///获取分类数据 [category:分类, page: 页数, count:每页的个数]
// static getCategoryData(String category, int page, {count = 20}) async {
//   String url = API_DATA + category + "/$count/$page";
//   HttpResponse response = await HttpManager.fetch(url);
//   return response.data;
// }

// ///获取所有的历史干货日期.
// static getHistoryDateData() async {
//   HttpResponse response = await HttpManager.fetch(API_HISTORY);
//   return response.data['results'];
// }

// ///搜索[简易搜索，后面拆分页]
// static searchData(String search) async {
//   HttpResponse response = await HttpManager.fetch(
//       API_SEARCH + "/$search/category/all/count/50/page/1");
//   return response.data['results'];
// }

// ///提交干货[url:干货地址,desc:干货描述,type:干货类型,debug:true为测试提交，false为正式提交
// static submitData(url, desc, who, type, {debug = false}) async {
//   FormData formData = FormData.from({
//     'url': url,
//     'desc': desc,
//     'who': who,
//     'type': type,
//     'debug': debug,
//   });
//   HttpResponse response =
//       await HttpManager.fetch(API_SUBMIT, params: formData, method: 'post');
//   return response.data;
// }

// ///获取所有的历史干货.
// static getHistoryContentData(int page, {count = 20}) async {
//   HttpResponse response =
//       await HttpManager.fetch(API_HISTORY_CONTENT + '/$count/$page');
//   return response.data['results'];
// }
}
