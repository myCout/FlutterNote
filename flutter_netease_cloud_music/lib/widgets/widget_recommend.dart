import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/public.dart';

class RecommendList extends StatelessWidget {
  final String title;
  final List showData;

  const RecommendList({Key key, this.title, this.showData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Text(title,style: commonTextStyle,),
          ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: AppColor.white,
        height: 100,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
//          physics: NeverScrollableScrollPhysics(), //屏蔽滚动
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //列数，每行几个
              mainAxisSpacing: 20, //主轴间距（这里是水平方向）
              crossAxisSpacing: 10, //交叉轴间距
              childAspectRatio: 1 / 1.1 //长宽比
          ),
          itemCount: 40,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
//                callback(index);
              },
              child: Container(
                color: AppColor.red,
                child: Column(
                  children: <Widget>[

//                    Container(
//                      padding: EdgeInsets.only(top: 5),
//                      child: Text(
//                        '$index',
//                        style: smallCommonTextStyle,
//                      ),
//                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
        ],
      ),
    );
  }
}
