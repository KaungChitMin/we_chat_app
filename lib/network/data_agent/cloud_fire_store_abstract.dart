import '../../data/vos/user_vo.dart';

abstract class FirebaseFireStoreABST {
  Future<void> createUser(UserVO userVO);

  Future<UserVO> getUserInfoById(String id);

  Future<void> addFriend(String qrCode, UserVO userVO);

  Stream<List<UserVO>> friendsList(String currentUserID);
}
