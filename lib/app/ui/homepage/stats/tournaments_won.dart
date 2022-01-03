import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';

class TournamentWon extends StatelessWidget {
  final int? tournamentsWonCount;
  TournamentWon({this.tournamentsWonCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.toWidth,
      height: 80.toHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.5, 0.9],
          colors: [
            AppColors.tournamentWonColor,
            AppColors.tournamentWonColor.withOpacity(.8),
            AppColors.tournamentWonColor.withOpacity(.7),
          ],
        ),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: tournamentsWonCount.toString(),
                  style: Default.standardTextDefaultStyleW700(
                      fontSize: 18.toFont, color: AppColors.white)),
              TextSpan(
                text: '\n${Translations.getInstance.text(Translations.kTournamentWon)}',
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
