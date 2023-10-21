import 'package:flutter/cupertino.dart';
import 'package:we_chats/data/vos/chat_vo.dart';
import 'package:we_chats/network/data_agent/real_time_database_impl.dart';

import '../constant/strings.dart';
import '../data/apply/we_chat_apply.dart';
import '../data/apply/we_chat_apply_impl.dart';
import '../network/data_agent/real_time_database_abstract.dart';

class ChatHistoryPageBloc extends ChangeNotifier {
  ///state instance
  final WeChatApply _apply = WeChatApplyImpl();
  final RealTimeDataBase _realTimeDataBase = RealTimeDatabaseImpl();

  ///state variable
  bool _dispose = false;
  String _loginUserID = '';
  List<ChatVO> _chatList = [];

  ///getter

  String get getLoginUserID => _loginUserID;

  List<ChatVO> get getChatList => _chatList;

  ChatHistoryPageBloc() {
    _loginUserID = _apply.getLoggedInUserID();

    _realTimeDataBase.getFriendsID().listen((event) {
      List<ChatVO> temp = [];

      for (var id in event) {
        _apply.getAllMessage(_loginUserID, id!).listen((chatList) {
          _apply.getUserInFoByID(id).then((value) {
            ChatVO lastChatVO = chatList.last;
            lastChatVO.name = value.userName!;
            lastChatVO.file = value.profileImage ?? kDefaultImage;

            temp.add(lastChatVO);
            _chatList = temp;
            notifyListeners();
          });
        });
      }
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
