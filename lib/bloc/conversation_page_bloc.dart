import 'package:flutter/material.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';
import 'package:we_chats/data/vos/chat_vo.dart';
import 'package:we_chats/data/vos/user_vo.dart';

import '../data/apply/we_chat_apply.dart';

class ConversationPageBloc extends ChangeNotifier {
  ///state instance
  final WeChatApply _apply = WeChatApplyImpl();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  ///state variable
  bool _dispose = false;
  bool _sendMessage = false;
  UserVO? _loginUserVO;
  UserVO? _friendVO;
  String _chatText = '';
  String _friendID = '';
  String _loginUserID = '';
  List<ChatVO>? _chatList = [];

  ///getter
  UserVO? get loginUserVO => _loginUserVO;

  UserVO? get friendVO => _friendVO;

  List<ChatVO>? get getChatList => _chatList;

  FocusNode get focusNode => _focusNode;

  bool get sendMessage => _sendMessage;

  TextEditingController get textEditingController => _textEditingController;

  ConversationPageBloc(String iDForFriend) {
    _friendID = iDForFriend;
    _loginUserID = _apply.getLoggedInUserID();
    _apply.getUserInFoByID(_loginUserID).then((value) {
      _loginUserVO = value;
      notifyListeners();
    });

    _apply.getUserInFoByID(_friendID).then((value) {
      _friendVO = value;
      notifyListeners();
    });

    _apply.getChattingTime(_loginUserID, _friendID).listen((event) {
      _chatList = event;
      notifyListeners();
    });
  }

  void stateMessaging() {
    ChatVO chatVO = ChatVO(
        userID: _loginUserID,
        id: '',
        name: loginUserVO?.userName ?? '',
        message: _chatText,
        file: loginUserVO?.file ?? '',
        videoFile: '');

    _apply.messaging(_loginUserID, _friendID, chatVO);
    _apply.messaging(_friendID, _loginUserID, chatVO);
    _sendMessage = false;
    textEditingController.clear();
    notifyListeners();
  }

  void isSendMessage(String text) {
    _chatText = text;
    _sendMessage=true;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }
}
