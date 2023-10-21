import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../widgets/easy_text_widget.dart';

class ChatTextItemView extends StatelessWidget {
  const ChatTextItemView({
    super.key,
    required this.text,
    required this.isLeft,
  });

  final bool isLeft;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(kSP10x),
        width: text.length < kSP40x ? null : kMaterialButtonWidth,
        decoration: BoxDecoration(
            color: (isLeft) ? kGreyColor : kPrimaryColor,
            borderRadius: BorderRadius.circular(kSP10x)),
        child: EasyTextWidget(
          text: text,
          fontSize: kMessagesFontSize,
          color: kWhiteColor,
          maxLine: 1000000,
        ));
  }
}
