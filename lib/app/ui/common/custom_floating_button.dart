import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  final Color? buttonColor;
  final Function? onSubmitPress;
  final String? title;
  CustomFloatingButton({this.buttonColor, this.onSubmitPress, this.title});
  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSubmitPress!();
      },
      child: Padding(
        padding: AppDimensions.horizontal16,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 48.toHeight,
                padding: AppDimensions.horizontal16Vertical12,
                decoration: BoxDecoration(
                    color: widget.buttonColor ??
                        AppColors.primaryText.withOpacity(.8),
                    borderRadius: BorderRadius.circular(10.toHeight)),
                child: Center(
                  child: Text(
                    widget.title ?? Translations.getInstance.text(Translations.kSubmit)!,
                    style: Default.standardTextDefaultStyleW500(
                        fontSize: 14.toFont, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
