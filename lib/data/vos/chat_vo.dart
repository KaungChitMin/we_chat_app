import 'package:json_annotation/json_annotation.dart';

part 'chat_vo.g.dart';

@JsonSerializable()
class ChatVO {
  @JsonKey(name: 'user_id')
  String userID;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'file')
  String file;

  @JsonKey(name: 'video_file')
  String videoFile;

  ChatVO({
    required this.userID,
    required this.id,
    required this.name,
    required this.message,
    required this.file,
    required this.videoFile,
  });

  @override
  String toString() {
    return 'ChattingUserVO{userID: $userID, name: $name, message: $message, file: $file, videoFile: $videoFile}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatVO &&
          runtimeType == other.runtimeType &&
          userID == other.userID &&
          name == other.name &&
          message == other.message &&
          file == other.file &&
          videoFile == other.videoFile;

  @override
  int get hashCode =>
      userID.hashCode ^
      name.hashCode ^
      message.hashCode ^
      file.hashCode ^
      videoFile.hashCode;

  factory ChatVO.fromJson(Map<String, dynamic> json) => _$ChatVOFromJson(json);

  Map<String, dynamic> toJson() => _$ChatVOToJson(this);
}
