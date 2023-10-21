import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/friends_page_bloc.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/data/vos/user_vo.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/empty_text_and_icon_widget.dart';

import '../constant/color.dart';
import '../view_items/friends_list_view_items/friends_image_names_view_item.dart';
import '../widgets/easy_text_widget.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FriendsPageBloc>(
      create: (_) => FriendsPageBloc(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Container(),
            backgroundColor: kPrimaryColor,
            title: const EasyTextWidget(
              text: kFriendsAppBarText,
              color: kWhiteColor,
              fontSize: kAppBarTextFontSize,
              fontWeight: FontWeight.w900,
            ),
          ),
          body: Selector<FriendsPageBloc, List<UserVO>>(
              shouldRebuild: (pre, next) => pre != next,
              selector: (_, bloc) => bloc.friendList,
              builder: (_, friendList, __) {
                return (friendList.isEmpty)
                    ? const EmptyTextAndIconWidget(
                        text: kEmptyFriendText,
                        icon: Icon(
                          Icons.people_alt_rounded,
                          size: kEmptyTextIconSize,
                          color: kGreyColor,
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///Show Total Friends Number Session
                          FriendNumberItemView(
                            friendLength: friendList.length,
                          ),

                          const Divider(),

                          ///Friends Profile And User Name Session
                          Expanded(
                            child: ListView.separated(
                              itemCount: friendList.length,
                              itemBuilder: (_, index) =>
                                  FriendImageNameItemView(
                                friendVO: friendList[index],
                              ),
                              separatorBuilder: (_, index) => const SizedBox(
                                height: kSP5x,
                              ),
                            ),
                          ),
                        ],
                      );
              })),
    );
  }
}

class FriendNumberItemView extends StatelessWidget {
  const FriendNumberItemView({
    super.key,
    required this.friendLength,
  });

  final int friendLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kSP20x, bottom: kSP20x, left: kSP10x),
      padding: const EdgeInsets.all(kSP5x),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(kSP5x)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people_alt_rounded,
            color: kGreyColor,
          ),
          const SizedBox(
            width: kSP5x,
          ),
          EasyTextWidget(
            text: '$friendLength Friend'.addS(friendLength),
            fontSize: kFontSize15x,
            fontWeight: FontWeight.w900,
            color: kGreyColor,
          ),
        ],
      ),
    );
  }
}
