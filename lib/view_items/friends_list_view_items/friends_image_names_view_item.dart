import 'package:flutter/material.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../constant/strings.dart';
import '../../data/vos/user_vo.dart';
import '../../pages/conversation_page.dart';
import '../../widgets/easy_text_widget.dart';

class FriendImageNameItemView extends StatelessWidget {
  const FriendImageNameItemView({
    super.key,
    required this.friendVO,
  });

  final UserVO friendVO;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kCardInFoSize,
      margin: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.navigateToNextScreen(
                  context,
                  ConversationPage(
                    friendID: friendVO.id!,
                    friendProfile: friendVO.profileImage ?? kDefaultImage,
                    friendName: friendVO.userName!,
                  ));
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: kFriendsImageSize,
                  backgroundImage:
                      NetworkImage(friendVO.profileImage ?? kDefaultImage),
                ),
                title: EasyTextWidget(
                  text: friendVO.userName!,
                  fontSize: kFontSize17x,
                  fontWeight: FontWeight.w900,
                  color: kGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
