class UserProfileModel extends Object {
  int? code;

  String? message;

  UserData? data;

  UserProfileModel({
    this.code,
    this.message,
    this.data,
  });
}

class UserData {
  String? firstName;

  String? lastName;

  int? tournamentsPlayed;
  int? tournamentsWon;

  int? eloRating;

  String? avatarName;

  String? avatarImage;

  UserData({
    this.firstName,
    this.lastName,
    this.tournamentsPlayed,
    this.tournamentsWon,
    this.eloRating,
    this.avatarName,
    this.avatarImage,
  });
}
