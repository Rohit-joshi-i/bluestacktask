import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';

class TournamentPlayed extends StatelessWidget {
  final int? tournamentsCount;
  TournamentPlayed({this.tournamentsCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.toWidth,
      height: 80.toHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.toHeight),
          bottomLeft: Radius.circular(20.toHeight),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.5, 0.9],
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(.7),
          ],
        ),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: tournamentsCount.toString(),
                  style: Default.standardTextDefaultStyleW700(
                      fontSize: 18.toFont, color: AppColors.white)),
              TextSpan(
                text: '\n${Translations.getInstance.text(Translations.kTournamentsPlayed)}',
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
