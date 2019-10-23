import 'dart:async';

import 'package:flutter_book/public.dart';
import 'package:flutter_book/utility/styles.dart';
import 'package:flutter_book/widget/widget_code_btn.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  int downSeconds = 0;
  Timer timer;

  Widget buildPhone() {
    return Container(
      // height: 44,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.paper,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onChanged: (text) {},
        autofocus: true,
        controller: usernameController,
        decoration: InputDecoration(
          hintText: '请输入电话号码',
          icon: Image.asset(R.assetsImgsIconInputPhoneNum),
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColor.gray, fontSize: 13.0),
        ),
        // maxLength: 11,
      ),
    );
  }

  fetchSmsCode() async {
    if (usernameController.text.length == 0) {
      Utils.showToast('手机号码不能为空');
      return;
    }
    try {
      Map<String, dynamic> jsonString =
      await AppAPI.getCaptcha(usernameController.text);
      bool status = jsonString["success"];

      if (status) {
        setState(() {
          downSeconds = 60;
        });
        coldDown();
      } else {
        String msg = jsonString["errmsg"];
        print('object:' + jsonString["errmsg"]);
        Utils.showToast(msg);
      }
    } catch (e) {}
  }

  coldDown() {
    timer = Timer(Duration(seconds: 1), () {
      setState(() {
        --downSeconds;
      });

      coldDown();
    });
  }

  Widget buildCode() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: AppColor.paper,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              onChanged: (text) {},
              controller: pswController,
              decoration: InputDecoration(
                hintText: "请输入验证码",
                icon: Image.asset(R.assetsImgsIconInputPwd),
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColor.gray, fontSize: 13.0),
              ),
            ),
          ),
          Container(color: Color(0xffdae3f2), width: 1, height: 40),
          CodeBtn(
            onPressed: fetchSmsCode,
            coldDownSeconds: downSeconds,
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: FlatButton(
        onPressed: loginBtnClick,
        child: Text(
          "登录",
          style: TextStyle(fontSize: 16, color: AppColor.white),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildPhone(),
          SizedBox(height: 10),
          buildCode(),
          SizedBox(height: 20),
          buildLoginBtn(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: AppColor.white,
        child: buildBody(),
        // child: Form(
        //   autovalidate: true,
        //   key: formKey, //设置globalKey，用于后面获取FormState
        //   child: Column(
        //     children: <Widget>[
        //       buildPhone(),
        //       SizedBox(height: 10),
        //       buildCode(),
//               TextFormField(
//                 onChanged: (text) {
// //                  print('账号当前输入：' + text);
//                 },
//                 autofocus: true,
//                 controller: usernameController,
//                 decoration: InputDecoration(
// //                   labelText: '用户名',
//                   hintText: '用户名',
//                   icon: Image.asset(R.assetsImgsIconInputPhoneNum),
//                   hintStyle: TextStyle(color: AppColor.gray, fontSize: 13.0),
//                 ),
//                 maxLength: 11,
//                 validator: (v) {
//                   return v.trim().length > 0 ? null : "用户名不能为空";
//                 },
//               ),
//               TextFormField(
//                   onChanged: (text) {
// //                    print('密码当前输入：' + text);
//                   },
//                   controller: pswController,
//                   decoration: InputDecoration(
// //                  labelText: "密码",
//                     hintText: "您的登录密码",
//                     icon: Image.asset(R.assetsImgsIconInputPwd),
//                     border: const UnderlineInputBorder(
//                       borderSide: BorderSide(style: BorderStyle.solid),
//                     ),
// //                  prefixIcon: Image.asset(R.assetsImgsIconInputPwd),
//                   ),
//                   obscureText: true,
//                   //校验密码
//                   validator: (v) {
//                     return v.trim().length > 5 ? null : "密码不能少于6位";
//                   }),
//               Padding(
//                 padding: EdgeInsets.only(top: 20),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: RaisedButton(
//                         padding: EdgeInsets.all(15.0),
//                         child: Text(
//                           "登录",
//                           style: TextStyle(color: AppColor.white, fontSize: 18),
//                         ),
//                         color: Theme.of(context).primaryColor,
//                         textColor: AppColor.color333,
//                         onPressed: () {
//                           //在这里不能通过此方式获取FormState，context不对
//                           //print(Form.of(context));

//                           // 通过_formKey.currentState 获取FormState后，
//                           // 调用validate()方法校验用户名密码是否合法，校验
//                           // 通过后再提交数据。
//                           if ((formKey.currentState as FormState).validate()) {
//                             //验证通过提交数据
//                             loginBtnClick();
//                           }
//                         },
//                       ),
//                     ),
        //     ],
        //   ),
        // )
        //     ],
        //   ),
        // ),
      ),
    );
  }

  loginBtnClick() async {
    try {
      Map<String, dynamic> jsonString =
      await AppAPI.postQuickLogin(usernameController.text, pswController.text);
      bool status = jsonString["success"];

      if (status) {
        print('object:' + jsonString["errmsg"]);
      } else {
        String msg = jsonString["errmsg"];
        print('object:' + jsonString["errmsg"]);
        Utils.showToast(msg);
      }
    } catch (e) {}

    setState(() {});
  }
}
