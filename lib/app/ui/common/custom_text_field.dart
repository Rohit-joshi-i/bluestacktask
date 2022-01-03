import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isPasswordField;
  final TextEditingController controller;
  final String? hintText;
  final String? textFieldHeadingName;
  final String? errorText;
  final bool showErrorText;
  final Function? onChanged;
  final Widget? endWidget;
  CustomTextField(
      {required this.controller,
      this.hintText,
      this.isPasswordField = false,
      this.textFieldHeadingName,
      this.errorText,
      this.showErrorText = false,
      this.onChanged,
      this.endWidget});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          /// Heading field
          ///
          Text(widget.textFieldHeadingName ?? '',
              style: Default.standardTextDefaultStyleW500(
                fontSize: 16.toFont,
                color: AppColors.primaryText,
              )),
          SizedBox(
            height: 10.toHeight,
          ),
          Container(
            height: 48.toHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.toHeight),
              border: Border.all(
                color: AppColors.primaryText.withOpacity(.4),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    enableInteractiveSelection: true,
                    style: Default.standardTextDefaultStyleW500(
                        fontSize: 16.toHeight, color: AppColors.primaryText),
                    obscureText: widget.isPasswordField!,
                    controller: widget.controller,
                    autofocus: false,
                    onChanged: (value) {
                      widget.onChanged!(value);
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: AppDimensions.horizontal16Vertical12,
                        hintText: widget.hintText ?? '',
                        hintStyle: TextStyle(
                          color: AppColors.primaryText.withOpacity(.4),
                        )),
                  ),
                ),

                ///
                /// Trailing Icon
                ///
                widget.endWidget != null
                    ? widget.endWidget!
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: 10.toHeight,
          ),

          ///
          /// Error widget If we want to show error text
          ///
          widget.showErrorText
              ? Center(
                  child: Text(
                    widget.errorText ?? '',
                    style: Default.standardTextDefaultStyleW500(
                        fontSize: 12.toFont, color: AppColors.red),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
