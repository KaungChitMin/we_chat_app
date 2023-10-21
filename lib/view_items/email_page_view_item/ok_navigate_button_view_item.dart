import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/email_page_bloc.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/data/vos/user_vo.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/easy_text_widget.dart';
import 'package:we_chats/widgets/material_button_widget.dart';

import '../../pages/home_page.dart';

class MaterialOrOkButtonItemView extends StatelessWidget {
  const MaterialOrOkButtonItemView(
      {super.key, required this.userVO, required this.imageFile});

  final UserVO userVO;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Selector<EmailPageBloc, String>(
      selector: (_, bloc) => bloc.getErrorEmailText,
      builder: (context, errorEmailText, __) {
        return MaterialButtonWidget(
            onPressed: () {
              context.getEmailPageBlocInstance().getErrorEmailText;
              if (errorEmailText.isEmpty) {
                context
                    .getEmailPageBlocInstance()
                    .getUserInfo(userVO, imageFile)
                    .then((value) => context.navigateToNextScreen(
                        context, const WeChatHomePage()))
                    .catchError((error) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: EasyTextWidget(
                          text: error.toString(),
                          color: kErrorColor,
                        ))));
              }
            },
            backGroundColor: kMaterialButtonColor,
            textColor: kWhiteColor,
            childText: 'OK');
      },
    );
  }
}
