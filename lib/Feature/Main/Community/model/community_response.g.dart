// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityResponse _$CommunityResponseFromJson(Map<String, dynamic> json) =>
    CommunityResponse(
      (json['id'] as num).toInt(),
      (json['userId'] as num).toInt(),
      json['userName'] as String,
      json['title'] as String,
      json['content'] as String,
      json['createdDateTime'] as String?,
      json['modifiedDateTime'] as String?,
      json['imagePath'],
      json['profileImage'] as String?,
    );

Map<String, dynamic> _$CommunityResponseToJson(CommunityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'title': instance.title,
      'content': instance.content,
      'createdDateTime': instance.createdDateTime,
      'modifiedDateTime': instance.modifiedDateTime,
      'imagePath': instance.imagePath,
      'profileImage': instance.profileImage,
    };
