import 'package:flutter/material.dart';

class SelectedList extends StatefulWidget {
  SelectedList({Key key}):super(key : key);
  @override
  _SelectedListState createState() => _SelectedListState();
}

class _SelectedListState extends State<SelectedList> {
  List widgets = [];
  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      widgets.add(getRow(i));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context,int position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length+1));
          print("row $i tapped");
        });
      },
    );
  }
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