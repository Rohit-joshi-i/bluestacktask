import 'package:bluestacktask/app/ui/homepage/stats/tournaments_played.dart';
import 'package:bluestacktask/app/ui/homepage/stats/tournaments_won.dart';
import 'package:bluestacktask/app/ui/homepage/stats/winning_percentage.dart';
import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatefulWidget {
  final int? tournamentCount;
  final int? tournamentWon;
  ProfileStats({this.tournamentCount, this.tournamentWon});
  @override
  _ProfileStatsState createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///
        /// Tournaments Played
        ///
        TournamentPlayed(
          tournamentsCount: widget.tournamentCount,
        ),
        SizedBox(
          width: 1,
          height: 80.toHeight,
        ),

        ///
        /// Tournaments Won
        ///
        TournamentWon(
          tournamentsWonCount: widget.tournamentWon,
        ),
        SizedBox(
          width: 1,
          height: 80.toHeight,
        ),

        ///
        ///Winning percentage
        ///
        WinningPercentage(
          winningPercentage: _getWinningPercentage(),
        ),
      ],
    );
  }

  ///
  /// Get winning percentage from tournament played and tournament
  ///
  int _getWinningPercentage() {
    double winningPercentage = widget.tournamentCount == 0
        ? 100
        : (widget.tournamentWon)! / (widget.tournamentCount ?? 1);

    return (winningPercentage * 100).toInt();
  }
}
