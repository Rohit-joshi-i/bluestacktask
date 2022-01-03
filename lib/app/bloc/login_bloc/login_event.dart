import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class UsernameChangeEvent extends LoginEvent {
  final String? userName;
  UsernameChangeEvent({this.userName});
  @override
  List<Object?> get props => [userName];
}

class PasswordChangeEvent extends LoginEvent {
  final String? password;
  PasswordChangeEvent({this.password});
  @override
  List<Object?> get props => [password];
}

class TogglePasswordEvent extends LoginEvent {
  final bool? passwordShow;
  TogglePasswordEvent({this.passwordShow});
  @override
  List<Object?> get props => [passwordShow];
}

class ChangeButtonColorEvent extends LoginEvent {
  final String? username;
  final String? password;
  ChangeButtonColorEvent({this.username, this.password});
  @override
  List<Object?> get props => [username, password];
}

class ShowLoginErrorEvent extends LoginEvent {
  final bool? hasFalseCredentials;
  ShowLoginErrorEvent({this.hasFalseCredentials = false});

  @override
  List<Object?> get props => throw UnimplementedError();
}
