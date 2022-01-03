class TournamentListModel {
  int? code;

  TournamentData? data;

  bool? success;
}

class TournamentData {
  String? cursor;

  List<Tournament>? tournaments;

  bool? isLastBatch;

  TournamentData({
    this.cursor,
    this.tournaments,
    this.isLastBatch,
  });
}

class Tournament extends Object {
  bool? isCheckInRequired;

  String? tournamentId;

  bool? tournamentEnded;

  String? tournamentEndDate;

  bool? areRandomTeamsAllowed;

  int? registeredTeams;

  String? adminLocale;

  String? regEndDate;

  String? startDate;

  String? rules;

  int? maxTeams;

  String? tournamentUrl;

  String? prizes;

  String? matchStyleType;

  String? tournamentType;

  String? geo;

  bool? isPasswordRequired;
  String? name;
  String? matchStyle;
  String? registrationUrl;
  bool? isRegistrationOpen;
  bool? isWaitlistEnabled;
  bool? incompleteTeamsAllowed;
  bool? isAutoResultAllowed;
  int? teamSize;
  String? status;
  bool? isLevelsEnabled;

  bool? indexPage;

  String? dynamicAppUrl;

  String? gameFormat;

  String? details;

  String? gameIconUrl;

  String? regStartDate;

  String? coverUrl;

  String? tournamentSlug;

  String? discordUrl;

  String? gameId;

  bool? resultSubmissionByAdmin;

  String? country;

  String? adminUsername;

  String? gameName;

  String? streamUrl;
}
