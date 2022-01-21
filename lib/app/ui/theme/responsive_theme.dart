import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';

class Responsive {
  Responsive._();

  static num _screenWidth = Get.width;
  static num _screenHeight = Get.height;
  static final Size uiSize = Size(370, 640);

  static double get _scaleWidth => _screenWidth / uiSize.width;
  static double get _scaleHeight => _screenHeight / uiSize.height;
  static double get _scaleText => min(_scaleWidth, _scaleHeight);

  static double setWidth(num width) => width * _scaleWidth;
  static double setHeight(num height) => height * _scaleHeight;
  static double setFontSize(num fontSize) => fontSize * _scaleText;
  static double radius(num r) => r * _scaleText;
}
