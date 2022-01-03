import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  UserProfileResponseModel(
    this.code,
    this.message,
    this.data,
  );

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserProfileResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'tournaments_played')
  int tournamentsPlayed;

  @JsonKey(name: 'tournaments_wont')
  int tournamentsWont;

  @JsonKey(name: 'elo_rating')
  int eloRating;

  @JsonKey(name: 'avatar_name')
  String avatarName;

  @JsonKey(name: 'avatar_image')
  String avatarImage;

  Data(
    this.firstName,
    this.lastName,
    this.tournamentsPlayed,
    this.tournamentsWont,
    this.eloRating,
    this.avatarName,
    this.avatarImage,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
