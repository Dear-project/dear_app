// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) => ProfileInfo(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      schoolName: json['schoolName'] as String?,
      introduce: json['introduce'] as String?,
      stsMessage: json['stsMessage'] as String?,
      imgPath: json['imgPath'] as String?,
      lclass: json['lclass'] as String?,
      mclass: json['mclass'] as String?,
    );

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'type': instance.type,
      'schoolName': instance.schoolName,
      'introduce': instance.introduce,
      'stsMessage': instance.stsMessage,
      'imgPath': instance.imgPath,
      'lclass': instance.lclass,
      'mclass': instance.mclass,
    };
