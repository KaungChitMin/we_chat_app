import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/conversation_page_bloc.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/data/vos/chat_vo.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/easy_text_widget.dart';

import '../view_items/conversation_page_view_items/chat_texts_view_item.dart';
import '../view_items/conversation_page_view_items/friend_profile_view_item.dart';
import '../view_items/conversation_page_view_items/text_field_view_item.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage(
      {super.key,
      required this.friendID,
      required this.friendProfile,
      required this.friendName});

  final String friendID;
  final String friendProfile;
  final String friendName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConversationPageBloc>(
      create: (_) => ConversationPageBloc(friendID),
      child: Consumer<ConversationPageBloc>(builder: (context, bloc, _) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.navigateBack(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: kSP20x,
                  ),
                  CircleAvatar(
                    radius: kSP20x,
                    backgroundImage: NetworkImage(friendProfile),
                  ),
                  const SizedBox(
                    width: kSP10x,
                  ),
                  EasyTextWidget(
                    text: friendName,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor,
                  ),
                ],
              ),
              actions: const [
                Icon(
                  Icons.phone_rounded,
                  color: kWhiteColor,
                ),
                SizedBox(
                  width: kSP20x,
                ),
                Icon(
                  Icons.videocam_rounded,
                  color: kWhiteColor,
                ),
                SizedBox(
                  width: kSP20x,
                ),
                Icon(
                  Icons.info_rounded,
                  color: kWhiteColor,
                ),
                SizedBox(
                  width: kSP20x,
                ),
              ],
            ),
            body: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: kSP10x),
                  reverse: true,
                  children: [
                    const SizedBox(
                      height: kSP80x,
                    ),
                    Selector<ConversationPageBloc, List<ChatVO>?>(
                      selector: (_, bloc) => bloc.getChatList,
                      builder: (context, chatList, __) {
                        if (chatList == null && chatList!.isEmpty) {
                          return const Center(
                              child: EasyTextWidget(
                            text: kSendMessageText,
                            color: kGreyColor,
                          ));
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          //padding: const EdgeInsets.only(top: kSP10x),
                          itemCount: chatList.length,
                          separatorBuilder: (_, index) => const SizedBox(
                            height: kSP20x,
                          ),
                          itemBuilder: (_, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment:
                                  (chatList[index].userID == friendID)
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                              children: [
                                ///Friend Profile Image Session
                                FriendProfileImageView(
                                  isLeft: chatList[index].userID == friendID,
                                  image: friendProfile,
                                ),
                                const SizedBox(
                                  width: kSP10x,
                                ),

                                ///Chat Texts Session
                                ChatTextItemView(
                                  isLeft: chatList[index].userID == friendID,
                                  text: chatList[index].message,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),

                ///Text Field Session
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextingMessageItemView(
                    isTyping:
                        context.getConversationPageBlocInstance().sendMessage,
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
