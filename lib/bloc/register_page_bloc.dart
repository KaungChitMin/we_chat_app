import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../constant/strings.dart';

import '../data/vos/user_vo.dart';

class RegisterPageBloc extends ChangeNotifier {
  ///create instance
  TextEditingController _regionTextEditingController = TextEditingController();

  ///state variable
  bool _dispose = false;
  bool _isShowPassword = false;
  bool _isAcceptAndContinue = false;
  File? _imageFile;
  String _username = '';
  String _password = '';
  String _phoneNum = '';
  String _userNameErrorText = '';
  String _passwordErrorText = '';
  String _phoneErrorText = '';
  String _regionName = '';

  ///getter
  File? get getImageFile => _imageFile;

  String get username => _username;

  String get password => _password;

  String get phoneNum => _phoneNum;

  String get getUserNameErrorText => _userNameErrorText;

  String get getPasswordErrorText => _passwordErrorText;

  String get getPhoneErrorText => _phoneErrorText;

  bool get getShowPassword => _isShowPassword;

  bool get getAcceptAndContinue => _isAcceptAndContinue;

  TextEditingController get getRegionTextController =>
      _regionTextEditingController;

  /// Setter
  set setRegionName(String regionName) => _regionName = regionName;

  set setUserName(String userName) => _username = userName;

  set setPhoneNo(String phoneNum) => _phoneNum = phoneNum;

  set setPassword(String password) => _password = password;

  ///register new user by adding id to firebase auth current user uid
  UserVO registerUserVO() {
    UserVO newUser = UserVO(
      id: '',
      userName: _username,
      region: _regionName,
      phone: _phoneNum,
      password: password,
      email: '',
      profileImage: _imageFile?.path ?? kDefaultImage,
      backgroundImage: kDefaultBackgroundImage,
      bioText: '',
      isLogout: false,
    );

    return newUser;
  }

  void setImage(File file) {
    _imageFile = file;
    notifyListeners();
  }

  void removePhoto() {
    _imageFile = null;
    notifyListeners();
  }

  void showPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  void onTapCheckIconButton() {
    _isAcceptAndContinue = !_isAcceptAndContinue;
    notifyListeners();
  }

  String _validationForUserName(String text) {
    if (text.isEmpty) {
      return 'Error: Please, enter user name';
    }
    return '';
  }

  String _validationForPhoneNumber(String text) {
    if (text.isEmpty) {
      return 'Error: Please, enter phone number';
    }
    return '';
  }

  String _validationForPassword(String text) {
    if (text.isEmpty) {
      return 'Error: Please, enter password';
    }
    if (text.length <= 6) {
      return 'Error: Password must be at least 6 character';
    }
    return '';
  }

  void validation(String text, String preFixText) {
    switch (preFixText) {
      case kUserNameText:
        _userNameErrorText = _validationForUserName(text);
        break;
      case kPhoneText:
        _phoneErrorText = _validationForPhoneNumber(text);
        break;
      case kPasswordText:
        _passwordErrorText = _validationForPassword(text);
        break;
    }
    notifyListeners();
  }

  void getShowCountryPicker(BuildContext context) {
    showCountryPicker(
        context: context,
        onSelect: (region) {
          _regionName = region.displayName;
          _regionTextEditingController =
              TextEditingController(text: _regionName);
          notifyListeners();
        });
  }

  Future<bool> stateAcceptAndContinue(bool isAccept) {
    if (_username.isEmpty) {
      _userNameErrorText = _validationForUserName('');
    }
    if (_phoneNum.isEmpty) {
      _phoneErrorText = _validationForPhoneNumber('');
    }
    if (_password.isEmpty) {
      _passwordErrorText = _validationForPassword('');
    }
    notifyListeners();

    if (isAccept &&
        _username.isNotEmpty &&
        _password.isNotEmpty &&
        _phoneNum.isNotEmpty) {
      return Future.value(true);
    }
    return Future.value(false);
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
