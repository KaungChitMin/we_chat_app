import 'package:json_annotation/json_annotation.dart';

part 'user_vo.g.dart';

@JsonSerializable()
class UserVO {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'region')
  String? region;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'background_image')
  String? backgroundImage;

  @JsonKey(name: 'bio_text')
  String? bioText;

  @JsonKey(name: 'file')
  String? file;

  bool? isLogout;

  UserVO({
    required this.id,
    required this.userName,
    required this.region,
    required this.phone,
    required this.password,
    required this.email,
    required this.profileImage,
    required this.backgroundImage,
    required this.bioText,
    this.isLogout = false,
  });

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);
}
