// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      (json['id'] as num).toInt(),
      json['email'] as String,
      json['name'] as String,
      json['type'] as String,
      json['schoolName'] as String?,
      json['lClass'] as String?,
      json['mClass'] as String?,
      json['introduce'] as String? ?? '',
      json['imgPath'] as String?,
      json['stsMessage'] as String? ?? '',
    );

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'type': instance.type,
      'schoolName': instance.schoolName,
      'lClass': instance.lClass,
      'mClass': instance.mClass,
      'introduce': instance.introduce,
      'imgPath': instance.imgPath,
      'stsMessage': instance.stsMessage,
    };
