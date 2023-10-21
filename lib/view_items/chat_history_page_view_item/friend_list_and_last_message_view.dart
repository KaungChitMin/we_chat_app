import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/data/vos/chat_vo.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../pages/conversation_page.dart';
import '../../widgets/easy_text_widget.dart';

class FriendListAndLastMessageItemView extends StatelessWidget {
  const FriendListAndLastMessageItemView({
    super.key,
    required this.chatVO,
  });

  final ChatVO chatVO;

  @override
  Widget build(BuildContext context) {
    String lastMessage = chatVO.message;
    String loginUserID = context.getChatHistoryPageBlocInstance().getLoginUserID;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.navigateToNextScreen(
                context,
                ConversationPage(
                  friendID: chatVO.userID,
                  friendName: chatVO.name,
                  friendProfile: chatVO.file,
                ));
          },

          ///Friends Name And Circle Avatar Image Session
          child: Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: kFriendProfile40x,
                  backgroundImage: NetworkImage(chatVO.file),
                ),
                title: EasyTextWidget(
                  text: chatVO.name,
                  color: kBlack54Color,
                  fontSize: kFontSize15x,
                  fontWeight: FontWeight.w900,
                ),

                ///Last Message You Or Your Friends Send Session
                subtitle: EasyTextWidget(
                  text: (loginUserID == chatVO.userID)
                      ? 'You: $lastMessage'
                      : lastMessage,
                  color: kGreyColor,
                )),
          ),
        ),

      ],



    );
  }
}
