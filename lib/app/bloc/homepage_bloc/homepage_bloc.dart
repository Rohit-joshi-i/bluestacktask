import 'package:bluestacktask/app/error/app_error.dart';
import 'package:bluestacktask/app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage_event.dart';
import 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(LoadProfile.loading('loading'));

  Repository repository = Repository();

  void getMoreTournaments(int? limit, String? cursor) {
    add(LoadTournamentEvent(limit: limit, cursor: cursor));
  }

  void getUserDetails() {
    add(LoadProfileEvent());
  }

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if (event is LoadProfileEvent) {
      try {
        yield LoadProfile.loading('message');

        var response = await repository.getUserData();

        if (response.getData != null) {
          ///
          /// Data fetched successfully from  User profile
          ///
          if (response.getData != null)
            yield LoadProfile.completed(
                userProfileModel: response.getData?.data);
        } else {
          ///
          /// Error while fetching data from profile
          ///
          yield LoadProfile.error(AppError.defaultException(
              exception: response.getBlueStackAppException));
        }
      } on Exception catch (exception) {
        yield LoadProfile.error(
            AppError.defaultException(exception: exception));
      } on Error catch (error) {
        yield LoadProfile.error(AppError.defaultError(error: error));
      }
    } else if (event is LoadTournamentEvent) {
      try {
        yield LoadMoreTournament.loading('loading');
        var response =
            await repository.getTournamentList(event.limit, event.cursor);
        if (response.getData != null) {
          if (response.getData!.success!) {
            ///
            /// Status Complete
            ///
            yield LoadMoreTournament.completed(
              cursor: response.getData?.data?.cursor,
              isLastBatch: response.getData?.data?.isLastBatch,
              tournamentList: response.getData?.data,
            );
          } else {
            ///
            /// Api Fail
            ///
            yield LoadMoreTournament.error(AppError.defaultException(
                exception: response.getBlueStackAppException));
          }
        } else {
          ///
          /// No data found
          ///
          yield LoadMoreTournament.error(AppError.defaultException(
              exception: response.getBlueStackAppException));
        }
      } on Exception catch (exception) {
        yield LoadMoreTournament.error(
            AppError.defaultException(exception: exception));
      } on Error catch (error) {
        yield LoadMoreTournament.error(AppError.defaultError(error: error));
      }
    }
  }
}
