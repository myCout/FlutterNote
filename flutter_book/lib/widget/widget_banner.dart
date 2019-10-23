import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_screen.dart';
import 'package:flutter_book/Model/BannerModel.dart';
import 'package:flutter_book/public.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final List<BannerModel> dataArray;

  const BannerWidget({Key key, this.dataArray}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataArray.isNotEmpty
        ? Container(
            width: Screen.width,
            height: 200.0,
            child: Swiper(
              itemBuilder: _swiperBuilder,
              itemCount: dataArray.length,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
              viewportFraction: 1,
              scale: 0.9,
              // control: SwiperControl(),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index个'),
            ))
        : Container();
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return ExtendedImage.network(
      dataArray[index].adPic,
      fit: BoxFit.cover,
      // width: ScreenUtil().setHeight(140),
      // height: ScreenUtil().setHeight(140),
      cache: true,
      border: Border.all(color: Colors.red, width: 1.0),
      // shape: boxShape,
      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
      // color: AppColor.primary,
    );
  }
  // child: CarouselSlider(
  //   height: ScreenUtil().setHeight(140),
  //   items: dataArray.map((model) {
  //     return Builder(
  //       builder: (BuildContext context) {
  //         return Container(
  //             width: Screen.width,
  //             margin: EdgeInsets.symmetric(horizontal: 10),
  //             decoration: BoxDecoration(color: Colors.red),
  //             child: ExtendedImage.network(
  //               model.adPic,
  //               fit: BoxFit.cover,
  //               // width: ScreenUtil().setHeight(140),
  //               // height: ScreenUtil().setHeight(140),
  //               cache: true,
  //               border: Border.all(color: Colors.red, width: 1.0),
  //               // shape: boxShape,
  //               // borderRadius: BorderRadius.all(Radius.circular(30.0)),
  //               // color: AppColor.primary,
  //             ));
  //       },
  //     );
  //   }).toList(),
  //   aspectRatio: 2,
  //   autoPlay: true,
  // ),

}
