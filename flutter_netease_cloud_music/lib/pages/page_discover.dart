import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> { //with TickerProviderStateMixin,  AutomaticKeepAliveClientMixin
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}
