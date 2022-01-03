import 'package:bluestacktask/app/repository/mapper/map_tournament_data.dart';
import 'package:bluestacktask/app/repository/model/tournament_list_model.dart';
import 'package:bluestacktask/app/repository/retro_client/retro_client.dart';
import 'package:bluestacktask/common_utils/log_util.dart';
import 'package:bluestacktask/services/api/api_response_wrapper.dart';
import 'package:bluestacktask/services/api/app_exception.dart';
import 'package:bluestacktask/services/api/service_manager.dart';
import 'package:bluestacktask/services/config/flavor_config.dart';

import 'mapper/user_profile_mapper.dart';
import 'model/user_profile_model.dart';

class Repository {
  ApiClient? _apiClient;

  Repository() {
    ///
    /// Get dio client from service manager
    ///
    var dioClient = ServiceManager.get()
        .getDioClient(baseUrl: FlavorConfig.instance.flavorValues.baseUrl);
    _apiClient = ApiClient(dioClient);
  }

  ///
  /// API to fetch tournament details
  ///
  Future<ApiResponseWrapper<TournamentListModel>> getTournamentList(
      int? limit, String? cursor) async {
    try {
      var response = await _apiClient!.getTournamentList(limit, cursor);

      return ApiResponseWrapper()..setData(mapTournament(response));
    } on Exception catch (exception, stacktrace) {
      LogUtil().printLog(
          tag: 'Bluestack api exception', message: exception.toString());
      LogUtil().printLog(
          tag: 'Bluestack api exception', message: stacktrace.toString());
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }

  ///
  /// API to fetch user details
  ///
  Future<ApiResponseWrapper<UserProfileModel>> getUserData() async {
    try {
      var response = await _apiClient!.getUserDetails();

      return ApiResponseWrapper()..setData(mapUserData(response));
    } on Exception catch (exception, stacktrace) {
      LogUtil().printLog(
          tag: 'User Profile api exception', message: exception.toString());
      LogUtil().printLog(
          tag: 'User Profile api exception', message: stacktrace.toString());
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }
}
