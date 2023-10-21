import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../constant/strings.dart';
import '../../data/vos/chat_vo.dart';
import 'real_time_database_abstract.dart';

class RealTimeDatabaseImpl extends RealTimeDataBase {
  RealTimeDatabaseImpl._();

  static final RealTimeDatabaseImpl _singleton = RealTimeDatabaseImpl._();

  factory RealTimeDatabaseImpl() => _singleton;

  final _firebaseRealtime = FirebaseDatabase.instance.ref();
  var auth = FirebaseAuth.instance;

  @override
  Stream<List<ChatVO>?> getMessageWhileChatting(
      String loginUserID, String friendID) {
    return _firebaseRealtime
        .child(kChatTextRootNode)
        .child(loginUserID)
        .child(friendID)
        .onValue
        .map((event) {
      return event.snapshot.children.map((e) {
        return ChatVO.fromJson(Map<String, dynamic>.from(e.value as Map));
      }).toList();
    });
  }

  @override
  Future<void> messaging(String loginUserID, String friendID, ChatVO chatVO) {
    return _firebaseRealtime
        .child(kChatTextRootNode)
        .child(loginUserID)
        .child(friendID)
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .set(chatVO.toJson());
  }

  @override
  Stream<List<ChatVO>> getAllChatTexts(String loginUserID, String friendID) {
    return _firebaseRealtime
        .child(kChatTextRootNode)
        .child(loginUserID)
        .child(friendID)
        .onValue
        .map((event) {
      return event.snapshot.children.map((e) {
        return ChatVO.fromJson(Map<String, dynamic>.from(e.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<String?>> getFriendsID() {
    String loggedInUserID = auth.currentUser?.uid ?? '';
    return _firebaseRealtime
        .child(kChatTextRootNode)
        .child(loggedInUserID)
        .onValue
        .map((event) {
      return event.snapshot.children.map((snapshot) {
        return snapshot.key;
      }).toList();
    });
  }
}
