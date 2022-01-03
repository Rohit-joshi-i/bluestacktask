import 'package:bluestacktask/app/repository/response/tournament_list_response_model.dart';
import 'package:bluestacktask/app/repository/response/user_profile_response_model.dart';
import 'package:bluestacktask/resources/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'retro_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) {
    return _ApiClient(dio);
  }

  ///
  /// Tournament list API
  ///
  @GET(kTournamentApiEndPoint)
  Future<TournamentListResponseModel> getTournamentList(
      @Path('limit') int? limit, @Path('cursor') String? cursor);

  ///
  /// User Details API
  ///
  @GET(kProfile)
  Future<List<UserProfileResponseModel>> getUserDetails({
    @Path('baseUrl') String? baseUrl = kUserBaseUrl,
  });
}
