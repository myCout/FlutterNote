import 'package:flutter_book/public.dart';

class CircleImageView extends StatelessWidget {
  final String imgUrl;
  final double imgWidth;
  final double imgHeight;

  const CircleImageView({Key key, this.imgUrl, this.imgWidth, this.imgHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExtendedImage.network(
        imgUrl,
        width: ScreenUtil().getWidth(imgWidth),
        height: ScreenUtil().getWidth(imgHeight),
        fit: BoxFit.fill,
        cache: true,
        border: Border.all(color: AppColor.line, width: 1.0),
        shape: BoxShape.circle,
      ),
//      child: CircleAvatar(
//        radius: ScreenUtil().getWidth(imgWidth),
//        backgroundImage: NetworkImage(imgUrl),
//      ),
    );
  }
}
