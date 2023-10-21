import 'package:flutter/material.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../widgets/sing_in_widget.dart';

class SignInBottomSheetItemView extends StatelessWidget {
  const SignInBottomSheetItemView(
      {Key? key, required this.onPressedForMobileNumber})
      : super(key: key);
  final Function onPressedForMobileNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: kSP30x,
          ),
          SignInButtonWidget(
            onTap: () {},
            text: 'Sign Up Via Facebook',
            icon: Icons.facebook_rounded,
          ),
          const SizedBox(
            height: kSP20x,
          ),
          SignInButtonWidget(
            onTap: () => onPressedForMobileNumber(),
            text: 'Sign Up Via Mobile',
            icon: Icons.phone_android_rounded,
          ),
          const SizedBox(
            height: kSP20x,
          ),
          SignInButtonWidget(
            onTap: () {
              context.navigateBack(context);
            },
            text: 'Cancel',
            icon: Icons.cancel_rounded,
          ),
        ],
      ),
    );
  }
}
