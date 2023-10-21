import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/email_page_bloc.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/data/vos/user_vo.dart';

import '../view_items/email_page_view_item/email_text_field_view.dart';
import '../view_items/email_page_view_item/ok_navigate_button_view_item.dart';
import '../widgets/easy_text_widget.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key, required this.userVO, required this.imageFile});

  final UserVO userVO;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailPageBloc>(
      create: (_) => EmailPageBloc(),
      child: Scaffold(
        backgroundColor: kBlack38Color,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSP30x),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Email Title Session
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const EasyTextWidget(
                    text: kEnterEmailText,
                    color: kWhiteColor,
                    fontSize: kEmailAddressFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),

                  ///Email Text Field  Session
                  const EmailTextFieldItemView(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),

                  ///Material Button Or Email Page Ok Button Session
                  MaterialOrOkButtonItemView(
                      userVO: userVO, imageFile: imageFile),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
