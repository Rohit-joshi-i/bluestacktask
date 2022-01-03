import 'package:flutter/material.dart';

import '../app_colours.dart';
import 'app_fonts.dart';

class Default {
  Default._();
  static TextStyle standardTextDefaultStyle({
    required double fontSize,
    required String fontFamily,
    Color color = AppColors.primaryTitle,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        height: lineHeight,
        fontFamily: fontFamily,
        letterSpacing: 1.0,
      );
  static TextStyle standardTextDefaultStyleW200(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w200,
        fontFamily: AppFonts.inter,
        height: lineHeight,
        fontSize: fontSize,
        letterSpacing: 1.0,
      );
  static TextStyle standardTextDefaultStyleW300(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextDefaultStyleW400(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextDefaultStyleW500(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextDefaultStyleW600(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextDefaultStyleW700(
          {required double fontSize,
          Color color = AppColors.primaryTitle,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );
}
