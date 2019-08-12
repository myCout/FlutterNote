import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final List dataArray;

  const BannerWidget({Key key, this.dataArray}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
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
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          var str = dataArray[index];
          return Image.network("${str}",fit: BoxFit.fill,);
        },
        itemCount: dataArray.length,
        autoplay: true,
        pagination: SwiperPagination(),
      ),
    );
  }
}