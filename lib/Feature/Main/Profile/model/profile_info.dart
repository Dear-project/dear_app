import 'package:json_annotation/json_annotation.dart';


part 'profile_info.g.dart';

@JsonSerializable()
class ProfileInfo {

@JsonKey(name: "id")
int id;

@JsonKey(name: "email")
String email;

@JsonKey(name: "name")
String name;

@JsonKey(name: "type")
String type;

@JsonKey(name: "schoolName")
String? schoolName;

@JsonKey(name: "introduce")
String? introduce;

@JsonKey(name: "stsMessage")
String? stsMessage;

@JsonKey(name: "imgPath")
String? imgPath;

@JsonKey(name: "lclass")
String? lclass;

@JsonKey(name: "mclass")
String? mclass;




ProfileInfo(
{
required this.id,
required this.email,
required this.name,
required this.type,
required this.schoolName,
required this.introduce,
required this.stsMessage,
required this.imgPath,
required this.lclass,
required this.mclass
}
);

factory ProfileInfo.fromJson(Map<String, dynamic> json) => _$ProfileInfoFromJson(json);

Map<String, dynamic> toJson() => _$ProfileInfoToJson(this);
}