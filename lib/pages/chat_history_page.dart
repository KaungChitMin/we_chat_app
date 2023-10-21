import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/data/vos/chat_vo.dart';

import 'package:we_chats/widgets/empty_text_and_icon_widget.dart';

import '../bloc/chat_history_page_bloc.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../view_items/chat_history_page_view_item/friend_list_and_last_message_view.dart';
import '../widgets/easy_text_widget.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatHistoryPageBloc(),
      child: Consumer<ChatHistoryPageBloc>(
        builder: (_, __, ___) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: const EasyTextWidget(
                text: kWeChatAppName,
                color: kWhiteColor,
                fontSize: kAppBarTextFontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
            body: Selector<ChatHistoryPageBloc, List<ChatVO>>(
              selector: (_, bloc) => bloc.getChatList,
              builder: (_, chatList, __) => (chatList.isEmpty)
                  ? const Center(
                      child: EmptyTextAndIconWidget(
                      icon: Icon(
                        Icons.message,
                        size: kEmptyTextIconSize,
                        color: kGreyColor,
                      ),
                      text: kEmptyChatText,
                    ))
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: kSP10x,
                          ),
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        return FriendListAndLastMessageItemView(
                          chatVO: chatList[index],
                        );
                      }),
            )),
      ),
    );
  }
}
