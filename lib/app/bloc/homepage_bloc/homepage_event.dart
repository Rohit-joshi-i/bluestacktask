import 'package:equatable/equatable.dart';

abstract class HomepageEvent extends Equatable {}

class LoadProfileEvent extends HomepageEvent {
  @override
  List<Object?> get props => [];
}

class LoadTournamentEvent extends HomepageEvent {
  final int? limit;
  final String? cursor;
  LoadTournamentEvent({this.limit, this.cursor});
  @override
  List<Object?> get props => [limit];
}
