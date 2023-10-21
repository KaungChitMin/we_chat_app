import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/register_page_bloc.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';
import '../view_items/register_view_items/accept_and_continue_button_view_item.dart';
import '../view_items/register_view_items/check_button_and_text_view_item.dart';
import '../view_items/register_view_items/choose_region_view_item.dart';
import '../view_items/register_view_items/image_picker_view_item.dart';
import '../view_items/register_view_items/name_phone_password_view_item.dart';
import '../view_items/register_view_items/register_title_view_item.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterPageBloc>(
        create: (context) => RegisterPageBloc(),
        child: Scaffold(
          backgroundColor: kBlackColor,
          body: Selector<RegisterPageBloc, File?>(
              selector: (_, bloc) => bloc.getImageFile,
              builder: (context, imageFile, _) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),

                        ///Register Title Session
                        const RegisterTitleItemView(),
                        const SizedBox(
                          height: kSP20x,
                        ),

                        ///Choose Profile Image Session
                        ChooseImageItemView(
                          file: imageFile ?? File(''),
                        ),
                        const SizedBox(
                          height: kSP40x,
                        ),

                        //This session is for register user info
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: kSP20x),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///User Name Text Session
                              UserNameItemView(),
                              SizedBox(
                                height: kSP5x,
                              ),

                              ///Region or Country session
                              ChooseRegionItemView(),
                              SizedBox(
                                height: kSP5x,
                              ),

                              ///Phone Number Text Session
                              PhoneNumberItemView(),
                              SizedBox(
                                height: kSP5x,
                              ),

                              ///Password Text Session
                              PasswordItemView(),
                              SizedBox(
                                height: kSP60x,
                              ),

                              ///Check button And {I have read and accept}Text Session
                              CheckButtonAndTextItemView(),
                              SizedBox(
                                height: kSP40x,
                              ),
                            ],
                          ),
                        ),

                        ///Accept And Continue Button Session
                        const AcceptAndContinueButtonItemView(),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
