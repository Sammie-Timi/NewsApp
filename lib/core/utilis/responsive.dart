import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static late double w;
  static late double h;

  static const baseWidth = 375;
  static const baseHeight = 812;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.width;
    screenWidth = _mediaQueryData.size.height;

    w = screenHeight / baseHeight;
    h = screenWidth / baseWidth;
  }
}
