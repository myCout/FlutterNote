import 'package:flutter_book/public.dart';

class CodeBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final int coldDownSeconds;

  const CodeBtn({Key key, this.onPressed, this.coldDownSeconds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (coldDownSeconds > 0) {
      return Container(
        width: ScreenUtil.getScaleW(context, 95),
        child: Center(
          child: Text(
            '${coldDownSeconds}s',
            style: TextStyle(fontSize: 14, color: AppColor.primary),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtil.getScaleW(context, 95),
        child: Text(
          '获取验证码',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.primary),
        ),
      ),
    );
  }
}
