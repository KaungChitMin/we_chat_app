import 'package:flutter/material.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/pages/register_page.dart';
import 'package:we_chats/utils/extensions.dart';

import '../constant/color.dart';
import '../view_items/login_sign_up_view_items/background_image_item_view.dart';
import '../view_items/login_sign_up_view_items/login_and_sign_up_button_view_item.dart';
import '../view_items/login_sign_up_view_items/sign_in_bottom_sheet_view_item.dart';

class LoginSignUpPage extends StatelessWidget {
  const LoginSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImageItemView(),
          LoginSignUpButtonItemView(
            onPressedLogin: () {},
            onPressedSignup: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kSP20x)),
                  backgroundColor: kBlueGreyColor,
                  context: context,
                  builder: (context) {
                    return SignInBottomSheetItemView(
                      onPressedForMobileNumber: () {
                        context.navigateBack(context);
                        context.navigateToNextScreen(
                            context, const RegisterPage());
                      },
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
