// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVO _$UserVOFromJson(Map<String, dynamic> json) => UserVO(
      id: json['id'] as String?,
      userName: json['user_name'] as String?,
      region: json['region'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      profileImage: json['profile_image'] as String?,
      backgroundImage: json['background_image'] as String?,
      bioText: json['bio_text'] as String?,
      isLogout: json['isLogout'] as bool? ?? false,
    )..file = json['file'] as String?;

Map<String, dynamic> _$UserVOToJson(UserVO instance) => <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'phone': instance.phone,
      'user_name': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'profile_image': instance.profileImage,
      'background_image': instance.backgroundImage,
      'bio_text': instance.bioText,
      'file': instance.file,
      'isLogout': instance.isLogout,
    };
