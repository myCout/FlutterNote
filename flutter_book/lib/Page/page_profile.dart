import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/imgPath.dart';
import 'package:flutter_book/public.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> cellList = [];
  List dataSource = [
    {'icon': 'icon0', 'name': '清理缓存'},
    {'icon': 'icon1', 'name': '分享应用'},
    {'icon': 'icon2', 'name': '关于我们'},
    {'icon': 'icon3', 'name': '用户协议'},
    {'icon': 'icon4', 'name': '隐私保护政策'},
    {'icon': 'icon0', 'name': '清理缓存'},
    {'icon': 'icon1', 'name': '分享应用'},
    {'icon': 'icon2', 'name': '关于我们'},
    {'icon': 'icon3', 'name': '用户协议'},
    {'icon': 'icon4', 'name': '隐私保护政策'},
    {'icon': 'icon0', 'name': '清理缓存'},
    {'icon': 'icon1', 'name': '分享应用'},
    {'icon': 'icon2', 'name': '关于我们'},
    {'icon': 'icon3', 'name': '用户协议'},
    {'icon': 'icon4', 'name': '隐私保护政策'}
  ];

  @override
  void initState() {
    super.initState();
//    for (var i = 0; i < dataSource.length; i++) {
//      cellList.add(getRow(dataSource[i]));
//    }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('标题'),
            backgroundColor: Theme.of(context).accentColor,
//              floating: true,
            pinned: true,
//              snap: true,
            flexibleSpace:
                Image.asset(Assets.assetsImgsImgMeizi, fit: BoxFit.cover),
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
      ),
//        child: Column(
//          children: <Widget>[
//
//            Container(
//              height: 170,
//              color: AppColor.white,
//              padding: EdgeInsets.only(left: 10, right: 15),
//              child: GestureDetector(
//                onTap: (){
//                  AppNavigator.pushLogin(context);
//                },
//                child: Row(
//                  children: <Widget>[
//                    CircleAvatar(
//                      radius: 36.0,
//                      backgroundImage: AssetImage(
//                        Assets.assetsImgsIconAvatar,
//                      ),
//                    ),
//                    Container(
//                      padding: EdgeInsets.only(left: 15),
//                      child: Text(
//                        '点击登录',
//                        style: TextStyle(
//                          color: AppColor.color333,
//                          fontSize: 18.0,
//                          fontFamily: "Courier",
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//            Divider(
//              height: 10.0,
//              indent: 0.0,
//              color: AppColor.line, //line
//            ),
//            Container(
//              child: ListView(
//                physics: NeverScrollableScrollPhysics(),
//                shrinkWrap: true,
//                children: this.cellList,
//              ),
//            )
//          ],
//        ),
    );
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
