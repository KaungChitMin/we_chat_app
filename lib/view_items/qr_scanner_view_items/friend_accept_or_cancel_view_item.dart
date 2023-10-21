import 'package:flutter/material.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/constant/strings.dart';
import 'package:we_chats/data/apply/we_chat_apply.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';
import 'package:we_chats/data/vos/user_vo.dart';
import 'package:we_chats/pages/home_page.dart';
import 'package:we_chats/utils/extensions.dart';
import 'package:we_chats/widgets/easy_text_widget.dart';
import 'package:we_chats/widgets/loading_widget.dart';

import '../../constant/color.dart';
import '../../widgets/material_button_widget.dart';

class FriendAcceptOrCancelDialogItemView extends StatelessWidget {
  const FriendAcceptOrCancelDialogItemView(
      {super.key, required this.friendUserVO, this.loginUserVO});

  final UserVO? friendUserVO;
  final UserVO? loginUserVO;

  @override
  Widget build(BuildContext context) {
    final WeChatApply apply = WeChatApplyImpl();

    return (friendUserVO == null)
        ? const LoadingWidget()
        : Center(
            child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kSP20x),
            padding: const EdgeInsets.all(kSP5x),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(kSP15x)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Friend Profile Session
                CircleAvatar(
                  radius: kFriendProfile40x,
                  backgroundImage:
                      NetworkImage(friendUserVO!.profileImage ?? kDefaultImage),
                ),
                const SizedBox(
                  width: kSP15x,
                ),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EasyTextWidget(
                        text: friendUserVO!.userName ?? '',
                        color: kBlack54Color,
                        fontSize: kFontSize20x,
                        fontWeight: FontWeight.w900,
                      ),

                      ///Confirm And Cancel Button Session
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MaterialButtonWidget(
                            onPressed: () {
                              apply
                                  .getAddFriend(
                                      friendUserVO!.id ?? '', loginUserVO!)
                                  .catchError((error) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: EasyTextWidget(
                                        text: error,
                                        color: kErrorColor,
                                      ))));

                              apply
                                  .getAddFriend(
                                      loginUserVO!.id ?? '', friendUserVO!)
                                  .catchError((error) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: EasyTextWidget(
                                        text: error,
                                        color: kErrorColor,
                                      ))));
                              context.navigateToNextScreen(
                                  context,
                                  const WeChatHomePage(
                                    pageIndex: kContactPageIndex,
                                  ));
                            },
                            miniWidth: kSP5x,
                            height: kSP30x,
                            fontSize: kFontSize15x,
                            textColor: kWhiteColor,
                            backGroundColor: kBlueGreyColor,
                            childText: 'Confirm',
                          ),
                          const SizedBox(
                            width: kSP10x,
                          ),
                          MaterialButtonWidget(
                            onPressed: () {
                              context.navigateToNextScreen(
                                  context,
                                  const WeChatHomePage(
                                    pageIndex: kQrPageIndex,
                                  ));
                            },
                            miniWidth: kSP5x,
                            height: kSP30x,
                            fontSize: kFontSize15x,
                            textColor: kWhiteColor,
                            backGroundColor: kBlueGreyColor,
                            childText: 'Cancel',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
