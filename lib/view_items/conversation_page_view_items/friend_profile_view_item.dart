import 'package:flutter/material.dart';

import '../../constant/dimens.dart';

class FriendProfileImageView extends StatelessWidget {
  const FriendProfileImageView(
      {Key? key, required this.isLeft, required this.image})
      : super(key: key);
  final bool isLeft;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isLeft,
        child: CircleAvatar(
          radius: kFriendAvatarSize,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(image),
        ));
  }
}
