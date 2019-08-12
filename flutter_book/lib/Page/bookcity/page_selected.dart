import 'package:flutter/material.dart';
import 'package:flutter_book/widget/widget_banner.dart';
import 'package:flutter_book/widget/widget_collection.dart';

class SelectedList extends StatefulWidget {
  SelectedList({Key key}) : super(key: key);
  @override
  _SelectedListState createState() => _SelectedListState();
}

class _SelectedListState extends State<SelectedList>
    with AutomaticKeepAliveClientMixin {
  List movieList = [];
  int start = 0;
  int total = 0;
  ScrollController scrollController = ScrollController();
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    scrollController.addListener(() => {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent)
            {
              //getMore();
            }
        });
    this.query(init: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // onRefresh: ,
      child: ListView.builder(
          controller: scrollController,
          itemCount: 3, //this.movieList.length,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
              List testData = [
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
                'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',
              ];
                return BannerWidget(dataArray: testData);
                break;
              case 1:
                return CollectionWidget();
                break;

              default:
                return MovieItem(data: 'add',);
            }
            
          }),
      onRefresh: () {},
    );
  }

  query({bool init = false}) async {
    // Map res = await api.getMovieList(
    //     history: widget.history, start: init ? 0 : this.start);
    // var start = res['start'];
    // var total = res['total'];
    // var subjects = res['subjects'];
    setState(() {
      if (init) {
        // this._movieList = subjects;
      } else {
        // this._movieList.addAll(subjects);
      }
      this.start = start + 10;
      this.total = total;
    });
  }
}

getMore() {
  // if (start < total) {
  //   query();
  // }
}

_getListData() {
  List<Widget> widgets = [];
  for (int i = 0; i < 20; i++) {
    widgets.add(GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        print("row $i tapped");
      },
    ));
  }
  return widgets;
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
