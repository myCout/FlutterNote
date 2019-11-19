import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_net_error.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// FutureBuilder 简单封装，除正确返回和错误外，其他返回 小菊花
/// 错误时返回定义好的错误 Widget，例如点击重新请求
class CustomSliverFutureBuilder<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Function futureFunc;
  final Map<String, dynamic> params;

  const CustomSliverFutureBuilder(
      {Key key, @required this.builder, @required this.futureFunc, this.params})
      : super(key: key);

  @override
  _CustomSliverFutureBuilderState<T> createState() =>
      _CustomSliverFutureBuilderState<T>();
}

class _CustomSliverFutureBuilderState<T>
    extends State<CustomSliverFutureBuilder<T>> {
  Future<T> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback)
    {
      _request();
    });
  }

  void _request() {
    setState(() {
      if (widget.params == null) {
        _future = widget.futureFunc(context);
      } else {
        _future = widget.futureFunc(context, params: widget.params);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _future == null
        ? SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: ScreenUtil().setWidth(200),
              child: CupertinoActivityIndicator(),
            ),
          )
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setWidth(200),
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: NetErrorWidget(
                        callback: () {
                          _request();
                        },
                      ),
                    );
                  }
              }
              return Container();
            },
          );
  }
}
