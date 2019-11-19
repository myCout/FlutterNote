import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/model/mv.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';

class TopMv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder<MVData>(
        futureFunc: NetUtils.getMVData,
        builder: (context, response) {
          var data = response.data;
          return ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
            shrinkWrap: true,
            itemCount: data.length,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return VEmptyView(ScreenUtil().setWidth(50));
            },
            itemBuilder: (context, index) {
              return Container(
                color: AppColor.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Utils.showNetImage(
                        data[index].cover,
                      ),
                    ),
                    VEmptyView(ScreenUtil().setWidth(20)),
                    Text(
                      '${data[index].name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: commonTextStyle,
                    ),
                    Text(
                      '${data[index].artistName}',
                      style: smallCommonTextStyle,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
