import 'package:flutter/material.dart';
import '../common_utils/screenutil.dart';

class AppDimensions {
  ///
  /// All
  ///
  static EdgeInsets all0 = EdgeInsets.all(0.toHeight);

  ///
  ///Horizontal
  ///
  static EdgeInsets horizontal16 =
      EdgeInsets.symmetric(horizontal: 16.toHeight);
  static EdgeInsets horizontal24 =
      EdgeInsets.symmetric(horizontal: 24.toHeight);

  ///
  ///Botton
  ///
  static EdgeInsets bottom80 = EdgeInsets.only(bottom: 80.toHeight);

  ///
  /// Right
  ///
  static EdgeInsets right10 = EdgeInsets.only(right: 10.toWidth);

  ///
  /// Horizontal and veritical
  ///
  static EdgeInsets horizontal16Vertical12 =
      EdgeInsets.symmetric(horizontal: 16.toWidth, vertical: 12.toHeight);
}
