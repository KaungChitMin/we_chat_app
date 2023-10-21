import 'dart:io';

import '../../network/data_agent/cloud_fire_store_abstract.dart';
import '../../network/data_agent/cloud_fire_store_impl.dart';
import '../../network/data_agent/firebase_auth_abstract.dart';
import '../../network/data_agent/firebase_auth_impl.dart';
import '../../network/data_agent/firebase_storage_Impl.dart';
import '../../network/data_agent/firebase_storage_abstract.dart';
import '../../network/data_agent/real_time_database_abstract.dart';
import '../../network/data_agent/real_time_database_impl.dart';
import '../vos/chat_vo.dart';
import '../vos/user_vo.dart';
import 'we_chat_apply.dart';

class WeChatApplyImpl extends WeChatApply {
  WeChatApplyImpl._();

  static final WeChatApplyImpl _singleton = WeChatApplyImpl._();

  factory WeChatApplyImpl() => _singleton;

  final FirebaseAuthABST _authDataAgent = FirebaseAuthImpl();
  final FirebaseStorageABST _firebaseStorage = FirebaseStorageImpl();
  final FirebaseFireStoreABST _firebaseFireStore =
      FirebaseFireStoreDataAgentImpl();
  final RealTimeDataBase _firebaseRealTime = RealTimeDatabaseImpl();

  @override
  Future login(String email, String password) => login(email, password);

  @override
  UserVO? loginUserInfo() => _authDataAgent.getLoggedInUserInfo();

  @override
  Future logout() => _authDataAgent.getLogout();

  @override
  Future registerNewUser(UserVO newUser) =>
      _authDataAgent.getRegisterNewUser(newUser);

  @override
  bool isLogin() => _authDataAgent.isLoggedIn();

  @override
  Stream<List<ChatVO>> getAllMessage(String loginUserID, String friendID) =>
      _firebaseRealTime.getAllChatTexts(loginUserID, friendID);

  @override
  Future<String> getUploadProfileToFirebase(File image) {
    return _firebaseStorage.uploadProfileToFirebase(image);
  }

  @override
  String getLoggedInUserID() => _authDataAgent.getLoggedInUserID();

  @override
  Stream<List<UserVO>?> getFriendsList(String loginUserID) =>
      _firebaseFireStore.friendsList(loginUserID);

  @override
  Future<UserVO> getUserInFoByID(String id) =>
      _firebaseFireStore.getUserInfoById(id);

  @override
  Future<void> getAddFriend(String qrCode, UserVO userVO) =>
      _firebaseFireStore.addFriend(qrCode, userVO);

  @override
  Stream<List<ChatVO>?> getChattingTime(String loginUserID, String friendID) =>
      _firebaseRealTime.getMessageWhileChatting(loginUserID, friendID);

  @override
  Future<void> messaging(String loginUserID, String friendID, ChatVO chatVO) =>
      _firebaseRealTime.messaging(loginUserID, friendID, chatVO);


}
