import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimens.dart';
import '../utils/text_utils.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget(
      {Key? key,
      required this.text,
      this.fontSize = kDefaultFontSize,
      this.fontWeight = FontWeight.w400,
      this.color = kBlackColor,
      this.decoration = TextDecoration.none,
      this.maxLine,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: FontTypography.getFontSizeByDevice(context, fontSize),
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
          overflow: overflow),
    );
  }
}
