import 'package:bluestacktask/app/bloc/bloc_common_state.dart';
import 'package:bluestacktask/app/error/app_error.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends ApiState {
  LoginState.completed(data) : super.completed(data);

  LoginState.loading(String message) : super.loading(message);

  LoginState.error(AppError error) : super.error(error);
}

///used for toggling error message on username
class UsernameChangeState extends LoginState {
  final bool isValid;
  final String? errorMessage;
  UsernameChangeState.completed({this.isValid = false, this.errorMessage})
      : super.completed(isValid);
}

///used for toggling error message on password
class PasswordChangeState extends LoginState {
  final bool isValid;
  final String? errorMessage;
  PasswordChangeState.completed({this.isValid = false, this.errorMessage})
      : super.completed(isValid);
}

///used for toggling obscure text in password
class PasswordToggleState extends LoginState {
  final bool? showPassword;

  PasswordToggleState.completed({this.showPassword})
      : super.completed(showPassword);
}

///used for toggling color of Submit button
class ButtonColorChangeState extends LoginState {
  final Color? buttonColor;

  ButtonColorChangeState.completed({this.buttonColor})
      : super.completed(buttonColor);
}

///used for Showing error message when validation fails
class ShowLoginError extends LoginState {
  final bool? userNotLoggedIn;

  ShowLoginError.completed({this.userNotLoggedIn})
      : super.completed(userNotLoggedIn);
}
