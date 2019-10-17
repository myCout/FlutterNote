import 'package:flutter/material.dart';
import 'package:flutter_book/Model/ModModel.dart';
import 'package:flutter_book/Page/View/view_firstModule.dart';
import 'package:flutter_book/Page/View/view_secendModule.dart';
import 'package:flutter_book/Page/View/view_thirdModule.dart';
import 'package:flutter_book/utility/app_api.dart';
import 'package:flutter_book/widget/widget_banner.dart';
import '../../Model/BannerModel.dart';
// 异步 Future
import 'dart:async';

class SelectedList extends StatefulWidget {
  @override
  _SelectedListState createState() => _SelectedListState();
}

class _SelectedListState extends State<SelectedList> {
  List<BannerModel> _bannerDataList = [];
  List<ModModel> _modList = [];
  @override
  void initState() {
    getBanner();
    getHomeMod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: _modList.length + 1,
      // itemExtent: 150, //强制高度
      itemBuilder: (BuildContext context, int index) {
        return buildModul(context, index);
      },
    ));
  }

  Widget buildModul(BuildContext context, int index) {
    switch (index) {
      case 0:
        return BannerWidget(dataArray: _bannerDataList);
        break;
      case 1:
        return FirstModulView(
          modModel: _modList[index - 1],
        );
        break;
      case 2:
        return SecendModuleView(
          modModel: _modList[index - 1],
        );
        break;
      case 3:
        return ThirdModuleView(
          modModel: _modList[index - 1],
        );
        break;
      default:
        return Container();
    }
  }

  Future<void> getBanner() async {
    var jsonString = await AppAPI.getHomeBanner();
    List<dynamic> originList = jsonString['data']['list'];
    BannerList bannerList = BannerList.fromJson(originList);
//////    bannerList.photos.forEach((item) => {
//////      print('dadadsad : ${item.title}')
//////    });
    setState(() {
      _bannerDataList = bannerList.photos;
    });
  }

  Future<void> getHomeMod() async {
    var jsonString = await AppAPI.getHomeMod();
    List<dynamic> originList = jsonString['data']['list'];

//    print('success :' + originList.toString());
    ModList list = ModList.fromJson(originList);
    // print('success + ${list.mList.length}');
    _modList = list.mList;
    // list.mList.forEach((item) => {print('dadadsad : ${item.intro}')});

    setState(() {
      this._modList = list.mList;
    });
  }
}

getMore() {
  // if (start < total) {
  //   query();
  // }
}

class MovieItem extends StatelessWidget {
  final data;
  const MovieItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget desc(k, v) => RichText(
          text: TextSpan(
            text: k,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 13),
            children: <TextSpan>[
              TextSpan(text: v),
            ],
          ),
        );
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, 'detail', arguments: data['id']);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 130,
        child: Row(
          children: <Widget>[
            Image.network(
              "http://bacaojia.qiniu.xy1212.com/0/d1011fbb3f8b564.jpeg",
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('名字', style: TextStyle(fontWeight: FontWeight.bold)),
                desc('豆瓣评分：', '10'),
                desc('主演：', 'DEMO'),
                desc('时长：', '100Min'),
                desc('类型：', 'Type'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
