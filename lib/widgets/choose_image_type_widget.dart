import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimens.dart';
import 'easy_text_widget.dart';

class ChooseImageWidget extends StatelessWidget {
  const ChooseImageWidget(
      {super.key,
      required this.onTap,
      required this.title,
      this.color = kWhiteColor});

  final Function onTap;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(kSP10x),
        alignment: Alignment.center,
        width: double.infinity,
        child: EasyTextWidget(
          text: title,
          color: color,
          fontSize: kDefaultFontSize,
        ),
      ),
    );
  }
}
