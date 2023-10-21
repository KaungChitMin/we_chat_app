import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../bloc/register_page_bloc.dart';
import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../widgets/easy_text_widget.dart';

class CheckButtonAndTextItemView extends StatelessWidget {
  const CheckButtonAndTextItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<RegisterPageBloc, bool>(
            selector: (_, bloc) => bloc.getAcceptAndContinue,
            builder: (context, isAccept, _) => CheckButtonView(
                  isAccept: isAccept,
                  onTap: () {
                    context
                        .getRegisterPageBlocInstance()
                        .onTapCheckIconButton();
                  },
                )),
        const SizedBox(
          width: kSP5x,
        ),
        const Expanded(
            child: EasyTextWidget(
          text:
              'I have read and accept the ||Terms of Services|| The information collected on this page is only used for account registration',
          color: kGreyColor,
          maxLine: 50,
        )),
      ],
    );
  }
}

class CheckButtonView extends StatelessWidget {
  const CheckButtonView({
    super.key,
    required this.onTap,
    required this.isAccept,
  });

  final Function onTap;
  final bool isAccept;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: CircleAvatar(
        radius: kSP10x,
        backgroundColor: (isAccept) ? kMaterialButtonColor : kGreyColor,
        child: Visibility(
          visible: isAccept,
          child: Icon(
            Icons.check,
            size: checkButtonIconSize,
            color: (isAccept) ? kWhiteColor : kWhiteColor,
          ),
        ),
      ),
    );
  }
}
