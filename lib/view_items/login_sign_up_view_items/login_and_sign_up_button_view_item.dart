import 'package:flutter/material.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';

import '../../widgets/material_button_widget.dart';

class LoginSignUpButtonItemView extends StatelessWidget {
  const LoginSignUpButtonItemView(
      {Key? key, required this.onPressedLogin, required this.onPressedSignup})
      : super(key: key);
  final Function onPressedLogin;
  final Function onPressedSignup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: kSP50x, left: kSP20x, right: kSP20x),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: MaterialButtonWidget(
                onPressed: () => onPressedLogin(),
                textColor: kWhiteColor,
                backGroundColor: kTransparentColor,
                childText: 'Log in',
              ),
            ),
            const SizedBox(
              width: kSP20x,
            ),
            Expanded(
              child: MaterialButtonWidget(
                onPressed: () => onPressedSignup(),
                textColor: kWhiteColor,
                backGroundColor: kTransparentColor,
                childText: 'Sign up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
