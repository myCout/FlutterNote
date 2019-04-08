import 'package:dio/dio.dart';
import 'http_manager.dart';
import 'http_response.dart';
// app_version = "3.1.0",
// 	app_channel = "appStore",
// 	app_os = "IOS",
// 	device_id = "0CCEA11E-AEE0-408D-B290-A67BBA40FB44",
// 	access_token = "PjGzC96.hbhfK3TEW0yL9R4L62RBrcezNbr3HNt79j8YZxAIr5.40Nu.XC2sOyzZGb5Ix8SSSXiT19azesp42yCK1wTI4g",
// 	java_token = "DIMf3zqDD_qIRJgDAJ0D40.llwJSw03uiEPnF5kWrYNKHGfvu1heEN357BQP2NlZ1ZPbHkiY18jsLRd6UCZcIA",
class APPApi {
  /// api urls.
  static const String API_MINI_HOST = 'http://uat.api.minizb.cn';//正式环境"http://api.minizb.cn" 

  static const String API_LOGIN_TEMP = "$API_MINI_HOST/j1/miniLogin/loginTmp";//游客登录;
  static const String API_BANNER = "$API_MINI_HOST/v1/live/live/banner"; // 轮播图
  static const String API_LIVE_HOT = "$API_MINI_HOST/v1/live/live/hot";//直播列表 

///游客登录
  static postLoginTmp() async {
    // FormData formData = FormData.from({
    //   'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44',
    // });
    // var headers =  {'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44','platform': 'IOS', 'version': 11.0};
    // option.headers = headers;
    HttpResponse response = await HttpManager.fetch(API_LOGIN_TEMP,header: {'device_id': '0CCEA11E-AEE0-408D-B290-A67BBA40FB44'}, method: 'post');
    return response.data;
  }

static getLiveHot() async {
   Map<String, String> params = {
     	'app_version' :"3.1.0",
      'app_channel' : "appStore",
      'app_os' : "IOS",
      'type' : "1",
      'device_id' : "B398BC27-9981-4A6F-A455-9A405B945DD6"
   };
//     {
// 	app_version = "3.1.0",
// 	app_channel = "appStore",
// 	app_os = "IOS",
// 	type = "1",
// 	device_id = "B398BC27-9981-4A6F-A455-9A405B945DD6",
// }
    // option.headers = headers;
    HttpResponse response = await HttpManager.fetch(API_LIVE_HOT,params: params, method: 'post');
    return response.data;
  }

  static getHomeBanner() async {
   Map<String, String> params = {
     	'app_version' :"3.1.0",
      'app_channel' : "appStore",
      'app_os' : "IOS",
      'type' : "1",
      'device_id' : "B398BC27-9981-4A6F-A455-9A405B945DD6"
   };
//     {
// 	app_version = "3.1.0",
// 	app_channel = "appStore",
// 	app_os = "IOS",
// 	type = "1",
// 	device_id = "B398BC27-9981-4A6F-A455-9A405B945DD6",
// }
    // option.headers = headers;
    HttpResponse response = await HttpManager.fetch(API_BANNER,params: params, method: 'post');
    return response.data;
  }



  // static const String API_DATA = "$API_MINI_HOST/api/data/";
  // static const String API_SEARCH = "$API_MINI_HOST/api/search/query";
  // static const String API_TODAY = "$API_MINI_HOST/api/today";
  // static const String API_HISTORY = "$API_MINI_HOST/api/day/history";
  // static const String API_HISTORY_CONTENT =
  //     "$API_MINI_HOST/api/history/content";
  // static const String API_SUBMIT = "$API_MINI_HOST/api/add2gank";
  // static const String CHECK_UPDATE = "$API_MINI_HOST/api/checkversion";

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