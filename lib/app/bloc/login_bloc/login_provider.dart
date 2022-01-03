import 'package:bluestacktask/app/bloc/login_bloc/login_event.dart';
import 'package:bluestacktask/app/bloc/login_bloc/login_state.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(UsernameChangeState.completed(isValid: true, errorMessage: ''));

  void usernameChange(String value) {
    add(UsernameChangeEvent(userName: value));
  }

  void passwordChange(String value) {
    add(PasswordChangeEvent(password: value));
  }

  void togglePassword(bool value) {
    add(TogglePasswordEvent(passwordShow: value));
  }

  void checkForSubmitButton(String username, String password) {
    add(ChangeButtonColorEvent(username: username, password: password));
  }

  void loginCheck(bool value) {
    add(ShowLoginErrorEvent(hasFalseCredentials: value));
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    ///
    /// Username Change event
    ///
    if (event is UsernameChangeEvent) {
      ///
      /// When Length < 3
      ///
      if (event.userName!.length < 3) {
        yield UsernameChangeState.completed(
            isValid: false, errorMessage: Translations.getInstance.text(Translations.kUsernameError3Char));
      } else if (event.userName!.length > 11) {
        ///
        /// When Length >11
        ///
        yield UsernameChangeState.completed(
            isValid: false, errorMessage: Translations.getInstance.text(Translations.kUsernameError11Char));
      } else {
        ///
        /// Valid Username
        ///
        yield UsernameChangeState.completed(isValid: true, errorMessage: '');
      }
    } else if (event is PasswordChangeEvent) {
      ///
      /// When Length < 3
      ///
      if (event.password!.length < 3) {
        yield PasswordChangeState.completed(
            isValid: false, errorMessage: Translations.getInstance.text(Translations.kPasswordError3Char));
      } else if (event.password!.length > 11) {
        ///
        /// When Length > 11
        ///
        yield PasswordChangeState.completed(
            isValid: false, errorMessage: Translations.getInstance.text(Translations.kPasswordError11Char));
      } else {
        ///
        /// Valid password
        ///
        yield PasswordChangeState.completed(isValid: true, errorMessage: '');
      }
    } else if (event is TogglePasswordEvent) {
      yield PasswordToggleState.completed(showPassword: event.passwordShow);
    } else if (event is ChangeButtonColorEvent) {
      if (event.username!.length >= 3 &&
          event.username!.length <= 11 &&
          event.password!.length >= 3 &&
          event.password!.length <= 11) {
        yield ButtonColorChangeState.completed(
            buttonColor: AppColors.primaryText);

        ///
        /// All requirements are met
        ///
      } else
        yield ButtonColorChangeState.completed(
            buttonColor: AppColors.primaryText.withOpacity(.4));
    } else if (event is ShowLoginErrorEvent) {
      yield ShowLoginError.completed(
          userNotLoggedIn: event.hasFalseCredentials);
    }
  }
}
