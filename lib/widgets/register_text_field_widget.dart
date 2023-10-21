import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimens.dart';
import '../utils/enums.dart';
import 'easy_text_widget.dart';

class RegisterTextFieldWidget extends StatelessWidget {
  const RegisterTextFieldWidget(
      {super.key,
      required this.preFitText,
      this.isShowPassword = false,
      required this.onChange,
      required this.textFieldInputType,
      this.preFixPhoneNumber = '',
      required this.hintText,
      this.showSuffixIcon = false,
      required this.onTapShowPassword});

  final String preFitText;
  final bool isShowPassword;
  final Function onChange;
  final TextFieldInputType textFieldInputType;
  final String preFixPhoneNumber;
  final String hintText;
  final bool showSuffixIcon;
  final Function onTapShowPassword;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: kSP90x,
      shape:
          const UnderlineInputBorder(borderSide: BorderSide(color: kGreyColor)),
      leading: EasyTextWidget(
        text: preFitText,
        color: kWhiteColor,
        fontSize: kPreFitFontSize,
      ),
      title: TextField(
        obscureText: (isShowPassword) ? true : false,
        onChanged: (text) => onChange(text),
        style: const TextStyle(color: kGreyColor),
        keyboardType: (textFieldInputType == TextFieldInputType.text)
            ? TextInputType.text
            : (textFieldInputType == TextFieldInputType.phone)
                ? TextInputType.phone
                : TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: kSP14x),
            child: EasyTextWidget(
              text: preFixPhoneNumber,
              color: kGreyColor,
              fontSize: kPreFitFontSize,
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: kWhiteColor,fontSize: kHintTextFontSize),
          suffixIcon: (showSuffixIcon)
              ? IconButton(
                  onPressed: () => onTapShowPassword(),
                  icon: Icon((isShowPassword)
                      ? Icons.visibility_off
                      : Icons.visibility))
              : null,
        ),
      ),
    );
  }
}
