import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/utils/enums.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/error_text_widget.dart';
import 'package:we_chats/widgets/register_text_field_widget.dart';

import '../../bloc/email_page_bloc.dart';

class EmailTextFieldItemView extends StatelessWidget {
  const EmailTextFieldItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterTextFieldWidget(
            preFitText: kEmailText,
            onChange: (emailText) {
              context.getEmailPageBlocInstance().setEmail = emailText;
              context.getEmailPageBlocInstance().validation(emailText);
            },
            textFieldInputType: TextFieldInputType.email,
            hintText: kEmailHintText,
            onTapShowPassword: () {}),
        const SizedBox(
          height: kSP20x,
        ),
        Selector<EmailPageBloc, String>(
            selector: (_, bloc) => bloc.getErrorEmailText,
            builder: (_, errorText, __) => Center(
              child: ErrorTextWidget(
                    error: errorText.startsWith('Error:'),
                    errorText: errorText,
                  ),
            )),
      ],
    );
  }
}
