import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';

class RegisterTitleItemView extends StatelessWidget {
  const RegisterTitleItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EasyTextWidget(
      text: kSignupWithMobileText,
      fontSize: kRegisterTitleFontSize,
      color: kWhiteColor,
    );
  }
}
