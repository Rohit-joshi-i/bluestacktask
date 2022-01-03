import 'package:bluestacktask/app/bloc/login_bloc/login_provider.dart';
import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EyeToggleWidget extends StatefulWidget {
  final bool show;
  EyeToggleWidget({this.show = false});
  @override
  _EyeToggleWidgetState createState() => _EyeToggleWidgetState();
}

class _EyeToggleWidgetState extends State<EyeToggleWidget> {
  LoginBloc? loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///
        /// Event to toggle show password
        ///
        loginBloc!.togglePassword(widget.show ? false : true);
      },
      child: Padding(
        padding: AppDimensions.right10,
        child: widget.show
            ? Icon(
                Icons.remove_red_eye_outlined,
                size: 20.toHeight,
              )
            : Icon(
                Icons.remove_red_eye_rounded,
                size: 20.toHeight,
              ),
      ),
    );
  }
}
