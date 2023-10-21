import 'package:flutter/material.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';

import '../../widgets/easy_text_widget.dart';

class EmptyTextAndIconWidget extends StatelessWidget {
  const EmptyTextAndIconWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          EasyTextWidget(
            text: text,
            fontSize: kFontSize20x,
            fontWeight: FontWeight.w900,
            color: kGreyColor,
          ),
        ],
      ),
    );
  }
}
