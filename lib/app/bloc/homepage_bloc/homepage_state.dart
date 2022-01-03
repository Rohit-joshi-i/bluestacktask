import 'package:bluestacktask/app/error/app_error.dart';
import 'package:bluestacktask/app/repository/model/tournament_list_model.dart';
import 'package:bluestacktask/app/repository/model/user_profile_model.dart';

import '../bloc_common_state.dart';

abstract class HomepageState extends ApiState {
  HomepageState.completed(data) : super.completed(data);

  HomepageState.loading(String message) : super.loading(message);

  HomepageState.error(AppError error) : super.error(error);
}

///
///For fetching user data
///
class LoadProfile extends HomepageState {
  UserData? userProfileModel;
  LoadProfile.completed({this.userProfileModel})
      : super.completed(userProfileModel);
  LoadProfile.loading(String message) : super.loading(message);
  LoadProfile.error(AppError error) : super.error(error);
}

///
/// For fetching tournaments
///
class LoadMoreTournament extends HomepageState {
  bool? isLastBatch;
  String? cursor;
  TournamentData? tournamentList;
  LoadMoreTournament.completed(
      {this.isLastBatch, this.tournamentList, this.cursor})
      : super.completed(isLastBatch);
  LoadMoreTournament.loading(String message) : super.loading(message);
  LoadMoreTournament.error(AppError error) : super.error(error);
}
