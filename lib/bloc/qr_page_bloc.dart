import 'package:flutter/material.dart';
import 'package:we_chats/data/apply/we_chat_apply.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';

import '../data/vos/user_vo.dart';

class WeChatQrCodePageBloc extends ChangeNotifier {
  ///state instance
  final WeChatApply _apply = WeChatApplyImpl();

  ///state variable
  bool _dispose = false;
  bool _loading = true;
  UserVO? _loginUserVO;
  String _loginUserQrCode = '';

  ///getter
  bool get getLoading => _loading;

  String get getLoginUserQrCode => _loginUserQrCode;

  UserVO? get getLoginUserVO => _loginUserVO;

  WeChatQrCodePageBloc() {
    ///getting login user qr code by id
    String id = _apply.getLoggedInUserID();

    _apply.getUserInFoByID(id).then((value) {
      _loginUserQrCode = id;
      _loginUserVO = value;
      _loading = false;
      notifyListeners();
    });
  }

  Future<void> getLogout() {
    return _apply.logout();
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
