import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/home_page_bloc.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/pages/chat_history_page.dart';
import 'package:we_chats/pages/friends_page.dart';
import 'package:we_chats/pages/qr_code_page.dart';
import 'package:we_chats/utils/extensions.dart';

import '../constant/dimens.dart';
import '../constant/strings.dart';

class WeChatHomePage extends StatelessWidget {
  const WeChatHomePage({super.key, this.pageIndex = 0});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(pageIndex),
      child: Selector<HomePageBloc, int>(
          selector: (_, bloc) => bloc.getPageIndex,
          builder: (context, pageIndex, __) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: kPrimaryColor,
                currentIndex: pageIndex,
                onTap: (index) =>
                    context.getWeChatHomePageBlocInstance().pageChange(index),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline_outlined),
                    label: kChatText,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail_outlined),
                    label: kFriendsText,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt_outlined),
                    label: kQrPageText,
                  )
                ],
              ),
              body: _buildBody(pageIndex))),
    );
  }
}

Widget _buildBody(int pageIndex) {
  switch (pageIndex) {
    case kChatHistoryPageIndex:
      return const ChatHistoryPage();
    case kContactPageIndex:
      return const FriendsPage();
    case kQrPageIndex:
      return const WeChatQrCodePage();
    default:
      return Container();
  }
}
