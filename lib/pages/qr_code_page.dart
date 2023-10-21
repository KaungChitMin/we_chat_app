import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:we_chats/data/vos/user_vo.dart';
import 'package:we_chats/pages/login_sign_up_page.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/loading_widget.dart';

import '../bloc/qr_page_bloc.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../widgets/easy_text_widget.dart';
import 'qr_code_scanner_page.dart';

class WeChatQrCodePage extends StatelessWidget {
  const WeChatQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeChatQrCodePageBloc>(
      create: (_) => WeChatQrCodePageBloc(),
      child: Scaffold(
        ///Navigate To Qr Scanner Code Session
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const EasyTextWidget(
            text: kQrAppBarText,
            color: kWhiteColor,
            fontSize: kAppBarTextFontSize,
            fontWeight: FontWeight.w900,
          ),
          actions: [
            Selector<WeChatQrCodePageBloc, UserVO?>(
                selector: (_, bloc) => bloc.getLoginUserVO,
                builder: (context, loginUserVO, __) => IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner_rounded,
                        color: kWhiteColor,
                      ),
                      onPressed: () {
                        context.navigateToNextScreen(
                            context,
                            WeChatQrCodeScannerPage(
                              loginUserVO: loginUserVO!,
                            ));
                      },
                    )),
            const SizedBox(
              width: kSP10x,
            )
          ],
        ),

        body: Selector<WeChatQrCodePageBloc, String>(
            selector: (_, bloc) => bloc.getLoginUserQrCode,
            builder: (context, qrCode, __) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),

                    ///Login User Qr Code Session
                    (qrCode.isEmpty)
                        ? const LoadingWidget()
                        : QrImageView(
                            data: qrCode,
                            size: MediaQuery.of(context).size.height * 0.25,
                          ),

                    ///Logout Button
                    const LogoutButtonItemView(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class LogoutButtonItemView extends StatelessWidget {
  const LogoutButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigatePushRemoveUntil(context, const LoginSignUpPage());
      },
      child: Container(
        margin: const EdgeInsets.only(top: kSP125x),
        padding: const EdgeInsets.all(kSP5x),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(kSP5x)),
        child: const EasyTextWidget(
          text: kLogoutText,
          color: kWhiteColor,
          fontSize: kFontSize17x,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
