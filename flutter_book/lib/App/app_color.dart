import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  static Color red = Colors.red;
  static Color primary = Color(0xff64BF76);
  static Color secondary = Color(0xff51dec6);
  // static Color red = Color(0xFFFF2B45);
  static Color orange = Color(0xFFF67264);
  static Color white = Color(0xFFFFFFFF);
  static Color paper = Color(0xFFF5F5F5);
  static Color line = Color(0xe5e5e5e5);
  static Color lightGray = Color(0xFFEEEEEE);
  static Color darkGray = Color(0xFF333333);
  static Color gray = Color(0xFF888888);
  static Color blue = Color(0xFF3688FF);
  static Color golden = Color(0xff8B7961);
  static Color random = getRandomColor();

  static Color color333 = Color(0xFF333333);
  static Color color666 = Color(0xFF666666);
  static Color color999 = Color(0xFF999999);
}

getRandomColor() {
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255), Random.secure().nextInt(255));
}
