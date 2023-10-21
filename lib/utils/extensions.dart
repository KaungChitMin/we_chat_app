import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chats/bloc/email_page_bloc.dart';
import 'package:we_chats/bloc/home_page_bloc.dart';

import '../bloc/chat_history_page_bloc.dart';
import '../bloc/conversation_page_bloc.dart';
import '../bloc/register_page_bloc.dart';

extension E on BuildContext {
  ///Blocs extension

  RegisterPageBloc getRegisterPageBlocInstance() => read<RegisterPageBloc>();

  EmailPageBloc getEmailPageBlocInstance() => read<EmailPageBloc>();

  HomePageBloc getWeChatHomePageBlocInstance() => read<HomePageBloc>();

  ConversationPageBloc getConversationPageBlocInstance() =>
      read<ConversationPageBloc>();

  ChatHistoryPageBloc getChatHistoryPageBlocInstance() =>
      read<ChatHistoryPageBloc>();

  ///Navigate Screens
  Future navigateToNextScreen(BuildContext context, Widget nextScreen) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => nextScreen));
  }

  void navigatePushRemoveUntil(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => nextScreen),
          (route) => false);

  Future navigatePushReplacement(BuildContext context, Widget nextScreen) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));

  void navigateBack(BuildContext context) => Navigator.of(context).pop();
}

extension S on String {
  String addS(int length) {
    if (length == 1) {
      return this;
    }
    return ' ${this}s ';
  }
}
