// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
    Map<String, dynamic> json) {
  return UserProfileResponseModel(
    json['code'] as int,
    json['message'] as String,
    Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['first_name'] as String,
    json['last_name'] as String,
    json['tournaments_played'] as int,
    json['tournaments_wont'] as int,
    json['elo_rating'] as int,
    json['avatar_name'] as String,
    json['avatar_image'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'tournaments_played': instance.tournamentsPlayed,
      'tournaments_wont': instance.tournamentsWont,
      'elo_rating': instance.eloRating,
      'avatar_name': instance.avatarName,
      'avatar_image': instance.avatarImage,
    };
