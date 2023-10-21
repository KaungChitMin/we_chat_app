// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatVO _$ChatVOFromJson(Map<String, dynamic> json) => ChatVO(
      userID: json['user_id'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      message: json['message'] as String,
      file: json['file'] as String,
      videoFile: json['video_file'] as String,
    );

Map<String, dynamic> _$ChatVOToJson(ChatVO instance) => <String, dynamic>{
      'user_id': instance.userID,
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'file': instance.file,
      'video_file': instance.videoFile,
    };
