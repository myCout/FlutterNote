import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_screen.dart';
import 'package:flutter_book/Model/BannerModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final List<BannerModel> dataArray;

  const BannerWidget({Key key, this.dataArray}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    // print('设备宽度:${ScreenUtil.screenWidth}');
    // print('设备高度:${ScreenUtil.screenHeight}');
    // print('底部安全区距离:${ScreenUtil.bottomBarHeight}');
    // print('状态栏高度:${ScreenUtil.statusBarHeight}');
    // print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    // print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    // print(
    //     '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    // print(
    //     '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    // print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');
    return Container(
//      width: ScreenUtil().setWidth(750),
      child: CarouselSlider(
        height: ScreenUtil().setHeight(140),
        items: dataArray.map((model) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: Screen.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Image.network(
                    "${model.adPic}",
                    fit: BoxFit.cover,
                  ));
            },
          );
        }).toList(),
        aspectRatio: 2,
        autoPlay: true,
      ),
    );
  }
}
