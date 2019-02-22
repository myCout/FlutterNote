import 'package:flutter/material.dart';
import 'package:tabbar_demo/frosted_glass_demo.dart';
class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FrostedGlassDemo(),
      ),
    );
  }
}