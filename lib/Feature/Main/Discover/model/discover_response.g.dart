// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverResponse _$DiscoverResponseFromJson(Map<String, dynamic> json) =>
    DiscoverResponse(
      (json['userId'] as num?)?.toInt(),
      json['name'] as String,
      json['school'] as String?,
      json['major'] as String?,
      json['profileImage'] as String?,
    )..email = json['email'] as String?;

Map<String, dynamic> _$DiscoverResponseToJson(DiscoverResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'school': instance.school,
      'major': instance.major,
      'email': instance.email,
      'profileImage': instance.profileImage,
    };
