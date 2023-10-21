import 'package:flutter/material.dart';

import '../constant/dimens.dart';
import 'easy_text_widget.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.backGroundColor,
      required this.textColor,
      required this.childText,
      this.miniWidth = kMaterialButtonWidth,
      this.height = kMaterialButtonHeight,
      this.fontSize = kMaterialButtonFontSize})
      : super(key: key);
  final Function onPressed;
  final Color backGroundColor;
  final Color textColor;
  final String childText;
  final double miniWidth;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor: textColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSP5x)),
        minWidth: miniWidth,
        height: height,
        color: backGroundColor,
        onPressed: () => onPressed(),
        child: EasyTextWidget(
          text: childText,
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ));
  }
}
