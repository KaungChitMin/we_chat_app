import 'dart:io';

import '../vos/chat_vo.dart';
import '../vos/user_vo.dart';

abstract class WeChatApply {
  Future registerNewUser(UserVO newUser);

  Future login(String email, String password);

  bool isLogin();

  Future logout();

  UserVO? loginUserInfo();

  String getLoggedInUserID();

  Future<String> getUploadProfileToFirebase(File image);


  Future<UserVO> getUserInFoByID(String id);

  Future<void> getAddFriend(String qrCode, UserVO userVO);

  Stream<List<UserVO>?> getFriendsList(String loginUserID);

  Stream<List<ChatVO>?> getChattingTime(String loginUserID, String friendID);

  Future<void> messaging(String loginUserID, String friendID, ChatVO chatVO);

  Stream<List<ChatVO>> getAllMessage(String loginUserID, String friendID);


}
