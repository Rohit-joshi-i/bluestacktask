import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';

class EloRating extends StatelessWidget {
  final int? eloRating;
  EloRating({this.eloRating});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.toHeight),
          border: Border.all(color: AppColors.primaryText)),
      child: Row(
        children: [
          SizedBox(
            width: 10.toWidth,
          ),
          Text(
            eloRating!.toString(),
            style: Default.standardTextDefaultStyleW600(
                fontSize: 20.toFont, color: AppColors.primaryText),
          ),
          SizedBox(
            width: 10.toWidth,
          ),
          Text(
            Translations.getInstance.text(Translations.kEloRating)!,
            style: Default.standardTextDefaultStyleW500(
                fontSize: 14.toFont, color: AppColors.grey),
          ),
          SizedBox(
            width: 10.toWidth,
          ),
        ],
      ),
    );
  }
}
