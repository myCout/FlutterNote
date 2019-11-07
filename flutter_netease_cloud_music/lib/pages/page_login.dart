import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/provider/user_model.dart';
import 'package:flutter_netease_cloud_music/utils/utils.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_common_button.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_vempty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  // 创建 AnimationController，用于控制动画
  // 必须提供动画时间
  AnimationController animationController;

  // 创建一个插值器，关联 AnimationController，返回一个新的 Animation 对象
//  通过 插值器 产生一系列的值;
//  在值更新的回调监听 addListener() 中，通过 setState() 刷新视图；
//  将 插值器 产生的值设置到相应的视图属性上。
  Animation animation;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(microseconds: 500), () {
      _controller.forward();
    });

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: 50.0, end: 200.0).animate(curvedAnimation)
      ..addStatusListener((status) {
//        print("$status");
//              AnimationStatus.forward
//              AnimationStatus.completed
//              在开始或结束时反转动画。这产生了循环效果：
//        if (status == AnimationStatus.completed) {
//          animationController.reverse();
//        } else if (status == AnimationStatus.dismissed) {
//          animationController.forward();
//        }
      });

//    animationController.addListener(() {
//      // 当动画更新时会调用
//      // 需要在这个函数中，调用 setState() 来触发视图刷新
//      setState(() {});
//    });
    animationController.forward(); //启动动画
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
//    return buildAnimationTest();
    return AnimationLogo(
      animation: animation,
    );
  }

  Widget buildBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: buildLogo(),
      ),
    );
  }

  Widget buildLogo() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(80),
          right: ScreenUtil().setWidth(80),
          top: ScreenUtil().setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Image.asset(
              'images/icon_logo.png',
              width: ScreenUtil().setWidth(90),
              height: ScreenUtil().setWidth(90),
            ),
          ),
          LoginAnimationWidget(animation: _animation),
        ],
      ),
    );
  }

  Widget buildAnimationTest() {
    print('tag:' + animation.value.toString());
    return Center(
      child: Container(
        width: animation.value, // 获取插值器计算出的 value// 作为属性值
        height: animation.value,
        color: Colors.redAccent,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }
}

class LoginAnimationWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  LoginAnimationWidget({@required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 34,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(3)),
              child: Text(
                'The Flutter Netease Cloud Music App',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            VEmptyView(50),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  hintText: 'Phone',
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: Colors.grey,
                  )),
            ),
            VEmptyView(40),
            TextField(
              obscureText: true,
              controller: _pwdController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
            ),
            VEmptyView(120),
            Consumer<UserModel>(
                builder: (BuildContext context, UserModel value, Widget child) {
              return CommonBtn(
                callback: () {
                  String phone = _phoneController.text;
                  String pwd = _pwdController.text;
                  if (phone.isEmpty || pwd.isEmpty) {
                    Utils.showToast('请输入账号或者密码');
                    return;
                  }
                  value.login(
                    context,
                    phone,
                    pwd,
                  );
                },
                content: '登录',
                width: double.infinity,
              );
            }),
          ],
        ));
  }
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        color: Colors.redAccent,
      ),
    );
  }
}
