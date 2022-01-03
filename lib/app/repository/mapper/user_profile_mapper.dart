import 'package:bluestacktask/app/repository/model/user_profile_model.dart';
import 'package:bluestacktask/app/repository/response/user_profile_response_model.dart';

///
/// Mapping the user data to response we are getting from the USer profile API
///
UserProfileModel mapUserData(List<UserProfileResponseModel> responseModel) {
  var model = UserProfileModel()
    ..code = responseModel[0].code
    ..message = responseModel[0].message
    ..data = _mapUserProfile(responseModel[0].data);
  return model;
}

UserData _mapUserProfile(Data data) {
  var model = UserData()
    ..firstName = data.firstName
    ..lastName = data.lastName
    ..avatarImage = data.avatarImage
    ..avatarName = data.avatarName
    ..eloRating = data.eloRating
    ..tournamentsPlayed = data.tournamentsPlayed
    ..tournamentsWon = data.tournamentsWont;
  return model;
}
