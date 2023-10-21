import '../../data/vos/chat_vo.dart';

abstract class RealTimeDataBase {
  Stream<List<ChatVO>?> getMessageWhileChatting(String loginUserID, String friendID);

  Future<void> messaging(String loginUserID, String friendID, ChatVO chatVO);

  Stream<List<ChatVO>> getAllChatTexts(String loginUserID, String friendID);

  Stream<List<String?>> getFriendsID();

}


