import 'dart:io';

import 'package:flutter/material.dart';

import '../data/apply/we_chat_apply.dart';
import '../data/apply/we_chat_apply_impl.dart';
import '../data/vos/user_vo.dart';

class EmailPageBloc extends ChangeNotifier {
  ///state Instance
  final WeChatApply _apply = WeChatApplyImpl();

  ///state variable
  bool _dispose = false;
  bool _loading = false;
  String _email = '';
  String _errorEmailText = '';

  ///getter

  String get getEmail => _email;

  String get getErrorEmailText => _errorEmailText;

  bool get loading => _loading;

  ///setter
  set setEmail(String email) => _email = email;

  ///upload to firebase userVo,email and profile image
  Future<void> getUserInfo(UserVO userVO, File? imageFile) async {
    _loading = true;
    notifyListeners();
    if (imageFile != null) {
      String imageUrl = await _apply.getUploadProfileToFirebase(imageFile);
      userVO.profileImage = imageUrl;
      userVO.email = _email;
      notifyListeners();
      _loading = false;
      notifyListeners();
      return _apply.registerNewUser(userVO);
    }
    return _apply.registerNewUser(userVO);
  }

  void validation(String text) {
    _errorEmailText = _validationForEmailErrorText(text);
    notifyListeners();
  }

  String _validationForEmailErrorText(String email) {
    if (email.isEmpty) {
      return 'Error: Please enter your email address';
    }
    return '';
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
