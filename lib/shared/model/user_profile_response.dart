import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "schoolName")
  String? schoolName;

  @JsonKey(name: "lclass")
  String? lClass;

  @JsonKey(name: "mclass")
  String? mClass;

  @JsonKey(name: "introduce", defaultValue: "")
  String introduce;

  @JsonKey(name: "imgPath")
  String? imgPath;

  @JsonKey(name: "stsMessage", defaultValue: "")
  String stsMessage;

  UserProfileResponse(
      this.id,
      this.email,
      this.name,
      this.schoolName,
      this.lClass,
      this.mClass,
      this.introduce,
      this.imgPath,
      this.stsMessage);

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}
