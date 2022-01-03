import 'package:bluestacktask/app/bloc/login_bloc/login_provider.dart';
import 'package:bluestacktask/app/bloc/login_bloc/login_state.dart';
import 'package:bluestacktask/app/ui/common/custom_floating_button.dart';
import 'package:bluestacktask/app/ui/common/custom_text_field.dart';
import 'package:bluestacktask/app/ui/login/model/user_model.dart';
import 'package:bluestacktask/app/ui/login/widget/eyetoggle_widget.dart';
import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/common_utils/shared_prefrences_util.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_constants.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:bluestacktask/services/navigation/locator.dart';
import 'package:bluestacktask/services/navigation/navigation_service.dart';
import 'package:bluestacktask/services/navigation/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  bool showUserNameError = false;
  String? userNameError = ''; //Username error message
  bool passWordError = false;
  String? passwordErrorText = ''; //password error message
  LoginBloc? loginBloc;
  bool togglePasswordField = true; //obscure text toggle
  Color? buttonColorChange =
      AppColors.primaryText.withOpacity(.3); //Setting initial button color
  bool showLoginError = false;
  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: BlocListener<LoginBloc, LoginState>(
            bloc: loginBloc,
            listener: (context, state) {
              if (state is UsernameChangeState) {
                ///
                /// Checking for error text in username
                ///
                showUserNameError = !state.isValid;
                userNameError = state.errorMessage;
              } else if (state is PasswordChangeState) {
                ///
                /// Checking for error text in password
                ///
                passWordError = !state.isValid;
                passwordErrorText = state.errorMessage;
              } else if (state is PasswordToggleState) {
                ///
                /// Toggle to show the password in hidden form
                ///
                togglePasswordField = state.showPassword!;
              } else if (state is ButtonColorChangeState) {
                ///
                /// Button color change when all the requirements for username and password are met
                ///
                buttonColorChange = state.buttonColor;
              } else if (state is ShowLoginError) {
                showLoginError = state.userNotLoggedIn!;

                ///
                /// Navigate to homepage after saving credentials
                ///
                if (!state.userNotLoggedIn!) {
                  locator<NavigationService>()
                      .pushAndRemoved(EnumRoute.homepage);
                  SharePreferenceData().setLoggedInStatus(value: true);
                }
              }
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                  child: Column(children: [
                ///
                /// GameTv Logo
                ///
                CachedNetworkImage(
                  imageUrl: kGameTvLogo,
                  placeholder: (context, value) {
                    return Container(
                      height: 300.toHeight,
                      decoration:
                          BoxDecoration(color: AppColors.secondaryBackground),
                    );
                  },
                  imageBuilder: (context, imgBuilder) {
                    return Container(
                      height: 300.toHeight,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imgBuilder, fit: BoxFit.cover)),
                    );
                  },
                  errorWidget: (context, value, _) {
                    return Container(
                      height: 300.toHeight,
                      decoration:
                          BoxDecoration(color: AppColors.secondaryBackground),
                    );
                  },
                ),
                SizedBox(
                  height: 20.toHeight,
                ),

                ///
                ///Username field
                ///
                BlocBuilder<LoginBloc, LoginState>(
                  bloc: loginBloc,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: userNameText,
                      hintText: Translations.getInstance.text(Translations.kHintUserName),
                      isPasswordField: false,
                      textFieldHeadingName: Translations.getInstance.text(Translations.kUserName),
                      showErrorText: showUserNameError,
                      errorText: userNameError,
                      onChanged: _userNameChange,
                    );
                  },
                ),
                SizedBox(
                  height: 30.toHeight,
                ),

                ///
                ///Password field
                ///
                BlocBuilder<LoginBloc, LoginState>(
                  bloc: loginBloc,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: passwordText,
                      hintText: Translations.getInstance.text(Translations.kHintPassword),
                      isPasswordField: togglePasswordField,
                      textFieldHeadingName: Translations.getInstance.text(Translations.kPassword),
                      showErrorText: passWordError,
                      errorText: passwordErrorText,
                      onChanged: _passwordChange,
                      endWidget: EyeToggleWidget(show: togglePasswordField),
                    );
                  },
                ),
                SizedBox(
                  height: 40.toHeight,
                ),

                ///
                /// Submit button
                ///
                BlocBuilder(
                    bloc: loginBloc,
                    buildWhen: (prev, curr) {
                      if (curr is ButtonColorChangeState ||
                          curr is ShowLoginError) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomFloatingButton(
                            buttonColor: buttonColorChange,
                            onSubmitPress: _submitButtonPress,
                          ),

                          ///
                          /// Incorrect credentials error message
                          ///
                          showLoginError
                              ? Padding(
                                padding: AppDimensions.horizontal16,
                                child: Text(
                                  Translations.getInstance.text(Translations.kIncorrectPassword)!,
                                  style: Default.standardTextDefaultStyleW500(
                                      fontSize: 16.toFont,
                                      color: AppColors.red),
                                  textAlign: TextAlign.center,
                                ),
                              )
                              : SizedBox.shrink()
                        ],
                      );
                    }),
              ])),
            ),
          )),
    );
  }

  //Username change event added
  _userNameChange(String value) {
    loginBloc!.usernameChange(value);
    loginBloc!.checkForSubmitButton(
        userNameText.text, passwordText.text); //buttonColorChange event added
  }

  //Password change event added
  _passwordChange(String value) {
    loginBloc!.passwordChange(value);
    loginBloc!.checkForSubmitButton(
        userNameText.text, passwordText.text); //buttonColorChange event added
  }

  ///
  /// Check if the credentials are correct
  ///
  _submitButtonPress() {
    var info = LoginCredentials.usersList!.firstWhere((element) {
      if (element.userName!.compareTo(userNameText.text) == 0 &&
          element.password!.compareTo(passwordText.text) == 0) {
        return true;
      }
      return false;
    }, orElse: () {
      return UserModel();
    });

    if (info.password != null && info.userName != null) {
      loginBloc!.loginCheck(false);
    } else {
      loginBloc!.loginCheck(true);
    }
  }
}
