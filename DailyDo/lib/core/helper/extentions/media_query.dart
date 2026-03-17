import 'package:flutter/material.dart';

extension ResponsiveExt on BuildContext {
  // مقاس التصميم في Figma
  static const double designWidth = 411;
  static const double designHeight = 731;

  // عرض الشاشة الحقيقي
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // تحويل width من فيجما
  double w(double value) {
    return (value / designWidth) * screenWidth;
  }

  // تحويل height من فيجما
  double h(double value) {
    return (value / designHeight) * screenHeight;
  }
  
  // تحويل radius من فيجما
  double r(double value) {
    return (value / designHeight) * screenHeight;
  }

  // للـ font
  double sp(double value) {
    double scaleW = screenWidth / designWidth;
    double scaleH = screenHeight / designHeight;
    return value * ((scaleW + scaleH) / 2);
  }
}
/*
*
* how to use
*
* context.h(اكتب القيمه الا موجوده ف فيجما للطول)
* context.wص(اكتب القيمه الا موجوده ف فيجما للعرض)
* context.sp(اكتب القيمه الا موجوده ف فيجما حجم الخط)
*
* */