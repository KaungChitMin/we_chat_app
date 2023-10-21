import 'package:flutter/material.dart';
import 'package:we_chats/widgets/easy_text_widget.dart';

import '../constant/color.dart';
import '../constant/dimens.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget(
      {super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        width: MediaQuery.of(context).size.height * 0.3,
        height: kSP45x,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSP5x),
            border: Border.all(color: Colors.white70)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            EasyTextWidget(
              text: text,
              color: kWhiteColor,
              fontSize: kSignInWithFontSize,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              width: kSP10x,
            ),
          ],
        ),
      ),
    );
  }
}
