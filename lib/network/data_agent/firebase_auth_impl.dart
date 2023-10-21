import 'package:firebase_auth/firebase_auth.dart';

import '../../data/vos/user_vo.dart';
import 'cloud_fire_store_abstract.dart';
import 'cloud_fire_store_impl.dart';
import 'firebase_auth_abstract.dart';

class FirebaseAuthImpl extends FirebaseAuthABST {
  FirebaseAuthImpl._();

  static final FirebaseAuthImpl _singleton = FirebaseAuthImpl._();

  factory FirebaseAuthImpl() => _singleton;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFireStoreABST _cloudDataAgent =
      FirebaseFireStoreDataAgentImpl();

  @override
  UserVO? getLoggedInUserInfo() {
    return UserVO(
        id: _auth.currentUser?.uid,
        userName: _auth.currentUser?.displayName,
        phone: _auth.currentUser?.phoneNumber,
        email: _auth.currentUser?.email,
        password: '',
        region: '',
        profileImage: '',
        backgroundImage: '',
        bioText: '',
       );
  }

  @override
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  @override
  Future getLogin(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

  @override
  Future getRegisterNewUser(UserVO newUser) => _auth
          .createUserWithEmailAndPassword(
              email: newUser.email ?? '', password: newUser.password ?? '')
          .then((credential) {
        User? user = credential.user;

        if (user != null) {
          user.updateDisplayName(newUser.userName).then((value) {
            newUser.id = user.uid;
            _cloudDataAgent.createUser(newUser);
          });
        }
      });

  @override
  String getLoggedInUserID() => _auth.currentUser?.uid ?? '';
}
