import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'easy_text_widget.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget(
      {super.key, required this.error, required this.errorText});

  final bool error;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: error,
      child: EasyTextWidget(
        text: errorText,
        color: kErrorColor,
      ),
    );
  }
}
