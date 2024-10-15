// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchingResponse _$MatchingResponseFromJson(Map<String, dynamic> json) =>
    MatchingResponse(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      professorId: (json['professorId'] as num).toInt(),
      matchingType: json['matchingType'] as String,
      userName: json['userName'] as String,
      schoolName: json['schoolName'] as String?,
      majorName: json['majorName'] as String?,
      userProfileImage: json['userProfileImage'] as String?,
    );

Map<String, dynamic> _$MatchingResponseToJson(MatchingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'professorId': instance.professorId,
      'matchingType': instance.matchingType,
      'userName': instance.userName,
      'schoolName': instance.schoolName,
      'majorName': instance.majorName,
      'userProfileImage': instance.userProfileImage,
    };
