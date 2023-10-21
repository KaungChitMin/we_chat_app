import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../bloc/register_page_bloc.dart';
import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';

class ChooseRegionItemView extends StatelessWidget {
  const ChooseRegionItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<RegisterPageBloc, TextEditingController>(
        selector: (_, bloc) => bloc.getRegionTextController,
        builder: (context, controller, _) => ListTile(
              minLeadingWidth: kSP90x,
              shape: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor)),
              leading: const EasyTextWidget(
                text: kRegionText,
                color: kWhiteColor,
                fontSize: kPreFitFontSize,
              ),
              title: TextField(
                controller: controller,
                onTap: () {
                  context.getRegisterPageBlocInstance().getShowCountryPicker(context);
                },
                onChanged: (regionName) {
                  context.getRegisterPageBlocInstance().setRegionName = regionName;
                },
                style: const TextStyle(color: kGreyColor),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: kHintTextForRegion,
                  hintStyle: TextStyle(color: kWhiteColor),
                ),
              ),
            ));
  }
}
