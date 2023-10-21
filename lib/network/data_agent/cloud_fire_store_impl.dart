import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constant/strings.dart';
import '../../data/vos/user_vo.dart';
import 'cloud_fire_store_abstract.dart';

class FirebaseFireStoreDataAgentImpl extends FirebaseFireStoreABST {
  FirebaseFireStoreDataAgentImpl._();

  static final FirebaseFireStoreDataAgentImpl _singleton =
      FirebaseFireStoreDataAgentImpl._();

  factory FirebaseFireStoreDataAgentImpl() => _singleton;

  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserVO userVO) {
    return _firebaseFireStore
        .collection(kRootNodeForUser)
        .doc(userVO.id.toString())
        .set(userVO.toJson());
  }

  @override
  Future<UserVO> getUserInfoById(String id) {
    return _firebaseFireStore
        .collection(kRootNodeForUser)
        .doc(id)
        .get()
        .asStream()
        .map((event) => UserVO.fromJson(event.data() ?? {}))
        .first;
  }

  @override
  Future<void> addFriend(String qrCode, UserVO userVO) {
    return _firebaseFireStore
        .collection(kRootNodeForUser)
        .doc(qrCode)
        .collection(kContactsPath)
        .doc(userVO.id)
        .set(userVO.toJson());
  }

  @override
  Stream<List<UserVO>> friendsList(String currentUserID) {
    return _firebaseFireStore
        .collection(kRootNodeForUser)
        .doc(currentUserID)
        .collection(kContactsPath)
        .snapshots()
        .map((querySnapShot) {
      return querySnapShot.docs.map((e) {
        return UserVO.fromJson(e.data());
      }).toList();
    });
  }
}
