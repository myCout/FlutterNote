import 'package:flutter/material.dart';

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key,this.title}) : super(key:key);
  final String title;
  @override
  _MyFadeTestState createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    curve = CurvedAnimation(parent: controller,curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        tooltip: 'fade',
        child: Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}