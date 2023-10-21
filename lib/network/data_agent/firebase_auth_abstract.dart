import '../../data/vos/user_vo.dart';

abstract class FirebaseAuthABST {
  Future getRegisterNewUser(UserVO newUser);

  Future getLogin(String email, String password);

  Future getLogout();

  UserVO? getLoggedInUserInfo();

  bool isLoggedIn();

  String getLoggedInUserID();
}
