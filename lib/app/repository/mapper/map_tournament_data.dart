import 'package:bluestacktask/app/repository/model/tournament_list_model.dart';
import 'package:bluestacktask/app/repository/response/tournament_list_response_model.dart';

///
/// Mapping the Tournament data to response we are getting from the BlueStacks APIx
///
TournamentListModel mapTournament(TournamentListResponseModel responseModel) {
  var model = TournamentListModel()
    ..success = responseModel.success
    ..code = responseModel.code
    ..data = _mapTournamentData(responseModel.data);
  return model;
}

TournamentData _mapTournamentData(Data tournamentData) {
  var model = TournamentData()
    ..isLastBatch = tournamentData.isLastBatch
    ..tournaments = _mapIndividualTournamentData(tournamentData.tournaments)
    ..cursor = tournamentData.cursor;
  return model;
}

List<Tournament> _mapIndividualTournamentData(List<Tournaments>? tournaments) {
  var list = <Tournament>[];
  tournaments?.forEach((element) {
    var model = Tournament()
      ..coverUrl = element.coverUrl
      ..name = element.details
      ..tournamentSlug = element.tournamentSlug
      ..gameName = element.gameName;
    list.add(model);
  });
  return list;
}
