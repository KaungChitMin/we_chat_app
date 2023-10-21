import 'package:flutter/material.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/data/apply/we_chat_apply.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';
import 'package:we_chats/pages/home_page.dart';
import 'package:we_chats/pages/login_sign_up_page.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/utils/image_utils.dart';
import 'package:we_chats/widgets/easy_text_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final WeChatApply apply = WeChatApplyImpl();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        (apply.isLogin())
            ? context.navigatePushReplacement(context, const WeChatHomePage())
            : context.navigatePushReplacement(context, const LoginSignUpPage());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: kLogoImageSize50x,
          backgroundImage: AssetImage(AssetsImageUtils.logoImage),
        ),
        const SizedBox(
          height: kSP10x,
        ),
        const EasyTextWidget(
          text: kWeChatAppName,
          fontSize: kFontSize20x,
          color: kBlack38Color,
          fontWeight: FontWeight.w900,
        )
      ],
    )));
  }
}
