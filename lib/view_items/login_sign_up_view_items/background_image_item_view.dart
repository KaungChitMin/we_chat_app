import 'package:flutter/material.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/utils/image_utils.dart';

class BackgroundImageItemView extends StatelessWidget {
  const BackgroundImageItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        AssetsImageUtils.backGroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
