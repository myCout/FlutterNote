import 'package:flutter/services.dart';
import 'package:flutter_book/public.dart';
import 'package:crypto/crypto.dart';

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
    } catch (e) {
      result = -1;
    }
    print("Result：$result");
  }

  /*
  * Md5加密
  * */
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }

  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  /*
      * 通过图片路径将图片转换成Base64字符串
      */
  static Future imageToBase64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
}
