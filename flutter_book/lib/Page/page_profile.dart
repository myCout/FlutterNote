import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/public.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  bool isLogin = false;
  UserModelEntity userModel;
  String nicknameTitle = "点击登录";
  ScrollController _controller; //ListView控制器
  bool isToTop = false; //标示目前是否需要启用 "Top" 按钮
  List<Widget> cellList = [];
  List dataSource = [
    {'icon': 'icon0', 'name': '清理缓存'},
    {'icon': 'icon1', 'name': '分享应用'},
    {'icon': 'icon2', 'name': '关于我们'},
    {'icon': 'icon3', 'name': '用户协议'},
  ];

  AppLifecycleState _lastLifecycleState;

  @override
  void deactivate() {
//    debugPrint('deactivatedeactivatedeactivatedeactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(ProfileScreen oldWidget) {
    debugPrint('didUpdateWidgetdidUpdateWidgetdidUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: 当前界面调用过setState之后会调用
    debugPrint('didChangeDependenciesdidChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('current state: $state');
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkUserStatus();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 1000) {
        //如果ListView已经向下滚动了1000，则启动Top按钮
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        setState(() {
          isToTop = false;
        });
      }
    });

    for (var item in dataSource) {
      cellList..add(getRow(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: getTableView(),
    );
  }

  Widget getTableView() {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().getHeight(150),
          color: AppColor.white,
          padding: EdgeInsets.only(left: 10, right: 15),
          child: buildHeaderRow(),
        ),
        Divider(
          height: 10.0,
          indent: 0.0,
          color: AppColor.line, //line
        ),
        Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: this.cellList,
          ),
        )
      ],
    );
  }

  headerdRowTap() {
    if (isLogin) {
      AppNavigator.pushEditProfile(context, userModel);
//      debugPrint('ddddddd');
//      Navigator.of(context).pushNamed('edit_profile', arguments: userModel).then((onValue){
//        if(mounted){
//          setState(() {
//            if (onValue != null) {
//              print('CallBackValue = $onValue');
//
//            }
//          });
//        }
//      });
    } else {
      Navigator.of(context).pushNamed('login_page').then((onValue) {
        if (mounted) {
          setState(() {
            if (onValue != null) {
              print('CallBackValue = $onValue');
              isLogin = onValue;
            }
          });
        }
      });
    }
  }

  Widget buildHeaderRow() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      //使用GestureDetector包裹Container，发现在Container内容为空的区域点击时，捕捉不到onTap点击事件。
      onTap: () {
        headerdRowTap();
      },
      child: isLogin ? buildUserInfoView() : buildLoginView(),
    );
  }

  Widget buildUserInfoView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ExtendedImage.network(
            userModel.avatar,
            width: ScreenUtil().getWidth(80),
            height: ScreenUtil().getWidth(80),
            fit: BoxFit.fill,
            cache: true,
            border: Border.all(color: AppColor.line, width: 1.0),
            shape: BoxShape.circle,
//            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  userModel.nickname,
                  style: TextStyle(
                    color: AppColor.color333,
                    fontSize: 18.0,
                    fontFamily: "Courier",
                  ),
                  textAlign: TextAlign.left,
                ),
              )),
          Container(
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColor.color333,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginView() {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 36.0,
            backgroundImage: AssetImage(
              R.assetsImgsIconAvatar,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              nicknameTitle,
              style: TextStyle(
                color: AppColor.color333,
                fontSize: 18.0,
                fontFamily: "Courier",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getRow(Map item) {
    return GestureDetector(
      child: Container(
//        padding: EdgeInsets.all(10),
        height: 55,
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Divider(
              height: 0.0,
              indent: 0.0,
              color: AppColor.white, //line
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    item['name'],
                    style: TextStyle(
                      color: AppColor.color333,
                      fontSize: 18.0,
                      fontFamily: "Courier",
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              indent: 0.0,
              color: AppColor.line, //line
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          // cellList = List.from(cellList);
          // cellList.add(getRow(cellList.length + 1));
          // print('Row $i');
        });
      },
    );
  }

  Widget getCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('个人中心'),
          backgroundColor: Theme
              .of(context)
              .accentColor,
//              floating: true,
          pinned: true,
//              snap: true,
          flexibleSpace: Image.asset(R.assetsImgsImgMeizi, fit: BoxFit.cover),
          expandedHeight: 200, //头部控件高度
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return getRow(dataSource[index]);
            },
            childCount: dataSource.length,
          ),
        )
      ],
    );
  }

  checkUserStatus() async {
    bool status = await UserManager().checkUserLoginStatus();
    if (status) {
      getUserData();
    }
  }

  getUserData() async {
    int userId = await UserManager().getUserId();
    debugPrint("userId = ${userId}");
    UserModelEntity model = await DataManager().getUserModel(userId);

    if (model != null) {
      debugPrint("name = ${model.avatar}");
      setState(() {
        userModel = model;
        isLogin = true;
      });
    }
  }
// _getListData() {
//   List<Widget> widgets = [];
//   for (int i = 0; i < 100; i++) {
//     widgets.add(GestureDetector(
//       child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Text("Row $i"),
//       ),
//       onTap: () {
//         print('row tapped');
//       },
//     ));
//   }
//   return widgets;
// }
}
