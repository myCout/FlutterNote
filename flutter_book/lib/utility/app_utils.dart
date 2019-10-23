import 'package:flutter/services.dart';
import 'package:flutter_book/public.dart';
import 'package:shared_preferences/shared_preferences.dart';


const platform = MethodChannel('samples.chenhang/utils');
class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/imgs/$name.$format';
  }

  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

//保存类型null的使用
//           sharedAddAndUpdate("dataList", null, "dddddddddd");
//           sharedGetData("dataList").then((Object data){
//             String userName= data;
//             print(userName);
//           });

//           //保存类型List<String>的使用
//           List<String> dataList = new List<String>();
//           dataList.add("111111");
//           dataList.add("222222");
//           sharedAddAndUpdate("dataList", List, dataList);
//           sharedGetData("dataList").then((Object data){
//             List<String> userName= data;
//             print(userName[0]);
//           });

//           //保存类型String的使用
//           sharedAddAndUpdate("userName", String, userInfo['companyId']);
//           sharedGetData("userName").then((Object data){
//             String userName= data;
//             print(userName);
//           });

//           //删除数据
//           sharedDeleteData("dataList");
  static sharedAddAndUpdate(String key, Object dataType, Object data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (dataType) {
      case bool:
        sharedPreferences.setBool(key, data);
        break;
      case double:
        sharedPreferences.setDouble(key, data);
        break;
      case int:
        sharedPreferences.setInt(key, data);
        break;
      case String:
        sharedPreferences.setString(key, data);
        break;
      case List:
        sharedPreferences.setStringList(key, data);
        break;
      default:
        sharedPreferences.setString(key, data.toString());
        break;
    }
  }

  static Future<Object> sharedGetData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  static sharedDeleteData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  //处理按钮点击
  static handleButtonClick() async {
    int result;
    //异常捕获
    try {
      //异步等待方法通道的调用结果
      result = await platform.invokeMethod('openAppMarket');
    }
    catch (e) {
      result = -1;
    }
    print("Result：$result");
  }
}
