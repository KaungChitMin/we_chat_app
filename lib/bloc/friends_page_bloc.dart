import 'package:flutter/material.dart';
import 'package:we_chats/data/apply/we_chat_apply.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';

import '../data/vos/user_vo.dart';

class FriendsPageBloc extends ChangeNotifier {
  ///state instance
  final WeChatApply _apply = WeChatApplyImpl();

  ///state variable
  bool _dispose = false;
  List<UserVO> _friendList = [];

  ///getter
  List<UserVO> get friendList => _friendList;

  FriendsPageBloc() {
    String id = _apply.getLoggedInUserID();
    _apply.getFriendsList(id).listen((event) {
      if (event != null) {
        _friendList = event;
        _friendList.sort((a, b) {
          String firstName = a.userName ?? '';
          String secName = b.userName ?? '';
          return firstName.compareTo(secName);
        });
      }
      notifyListeners();
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
