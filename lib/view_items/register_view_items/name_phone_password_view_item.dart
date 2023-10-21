import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../bloc/register_page_bloc.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../utils/enums.dart';
import '../../widgets/error_text_widget.dart';
import '../../widgets/register_text_field_widget.dart';

class UserNameItemView extends StatelessWidget {
  const UserNameItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterTextFieldWidget(
          preFitText: kUserNameText,
          hintText: kHintTextForFullName,
          textFieldInputType: TextFieldInputType.text,
          onTapShowPassword: () {},
          onChange: (userName) {
            context.getRegisterPageBlocInstance().setUserName = userName;
            context
                .getRegisterPageBlocInstance()
                .validation(userName, kUserNameText);
          },
        ),
        const SizedBox(
          height: kSP10x,
        ),
        Selector<RegisterPageBloc, String>(
          shouldRebuild: (pre, next) => pre != next,
          selector: (_, bloc) => bloc.getUserNameErrorText,
          builder: (_, errorText, __) => Center(
            child: ErrorTextWidget(
              errorText: errorText,
              error: errorText.startsWith('Error:'),
            ),
          ),
        )
      ],
    );
  }
}

class PhoneNumberItemView extends StatelessWidget {
  const PhoneNumberItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterTextFieldWidget(
          preFitText: kPhoneText,
          hintText: kHintTextForPhone,
          textFieldInputType: TextFieldInputType.phone,
          onTapShowPassword: () {},
          onChange: (phoneNo) {
            context.getRegisterPageBlocInstance().setPhoneNo = phoneNo;
            context
                .getRegisterPageBlocInstance()
                .validation(phoneNo, kPhoneText);
          },
        ),
        const SizedBox(
          height: kSP10x,
        ),
        Selector<RegisterPageBloc, String>(
          shouldRebuild: (pre, next) => pre != next,
          selector: (_, bloc) => bloc.getPhoneErrorText,
          builder: (_, errorText, __) => Center(
            child: ErrorTextWidget(
              errorText: errorText,
              error: errorText.startsWith('Error:'),
            ),
          ),
        )
      ],
    );
  }
}

class PasswordItemView extends StatelessWidget {
  const PasswordItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<RegisterPageBloc, bool>(
          shouldRebuild: (pre, next) => pre != next,
          selector: (_, bloc) => bloc.getShowPassword,
          builder: (_, isShowPassword, __) => RegisterTextFieldWidget(
            isShowPassword: !isShowPassword,
            showSuffixIcon: true,
            preFitText: kPasswordText,
            hintText: kHintTextForPassword,
            textFieldInputType: TextFieldInputType.text,
            onTapShowPassword: () {
              context.getRegisterPageBlocInstance().showPassword();
            },
            onChange: (password) {
              context.getRegisterPageBlocInstance().setPassword = password;
              context
                  .getRegisterPageBlocInstance()
                  .validation(password, kPasswordText);
            },
          ),
        ),
        const SizedBox(
          height: kSP10x,
        ),
        Selector<RegisterPageBloc, String>(
          selector: (_, bloc) => bloc.getPasswordErrorText,
          builder: (_, errorText, __) => Center(
            child: ErrorTextWidget(
              errorText: errorText,
              error: errorText.startsWith('Error:'),
            ),
          ),
        )
      ],
    );
  }
}
