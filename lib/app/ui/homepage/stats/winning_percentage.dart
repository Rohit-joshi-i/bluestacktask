import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';

class WinningPercentage extends StatelessWidget {
  final int? winningPercentage;
  WinningPercentage({this.winningPercentage});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.toWidth,
      height: 80.toHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.toHeight),
          topRight: Radius.circular(20.toHeight),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.3, 0.6, 0.9],
          colors: [
            AppColors.winningPercentageColorPrimary,
            AppColors.winningPercentageColorTertiary,
            AppColors.winningPercentageColorSecondary,
          ],
        ),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '$winningPercentage%',
                  style: Default.standardTextDefaultStyleW700(
                      fontSize: 18.toFont, color: AppColors.white)),
              TextSpan(
                text: '\n ${Translations.getInstance.text(Translations.kWinningPercentage)}',
                style: Default.standardTextDefaultStyleW400(
                    fontSize: 12.toFont, color: AppColors.white),
              ),
            ],
          ),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
