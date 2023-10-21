import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../bloc/register_page_bloc.dart';
import '../../constant/color.dart';
import '../../pages/email_page.dart';
import '../../widgets/material_button_widget.dart';

class AcceptAndContinueButtonItemView extends StatelessWidget {
  const AcceptAndContinueButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<RegisterPageBloc, bool>(
        selector: (_, bloc) => bloc.getAcceptAndContinue,
        builder: (context, isAccept, _) => MaterialButtonWidget(
              miniWidth: MediaQuery.of(context).size.width * 0.6,
              childText: 'Accept And Continue',
              backGroundColor: (isAccept) ? kMaterialButtonColor : kWhiteColor,
              textColor: (isAccept) ? kWhiteColor : kBlack38Color,
              onPressed: () {
                context
                    .getRegisterPageBlocInstance()
                    .stateAcceptAndContinue(isAccept)
                    .then((value) {
                  if (value) {
                    context.navigateToNextScreen(
                        context,
                        EmailPage(
                          userVO: context
                              .getRegisterPageBlocInstance()
                              .registerUserVO(),
                          imageFile: context
                                  .getRegisterPageBlocInstance()
                                  .getImageFile ??
                              File(''),
                        ));
                  }
                });
              },
            ));
  }
}
