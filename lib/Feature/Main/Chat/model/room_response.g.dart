// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) => RoomResponse(
      json['id'] as String,
      (json['adminId'] as num).toInt(),
      json['chatName'] as String,
      json['createdAt'] as String,
      (json['joinedUserId'] as num?)?.toInt(),
      json['createdDateTime'] as String?,
      json['lastMessage'] as String,
      json['lastMessageTimeStamp'] as String,
      (json['notReadCnt'] as num).toInt(),
      json['chatStatus'] as String,
    );

Map<String, dynamic> _$RoomResponseToJson(RoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adminId': instance.adminId,
      'chatName': instance.chatName,
      'createdAt': instance.createdAt,
      'joinedUserId': instance.joinedUserId,
      'createdDateTime': instance.createdDateTime,
      'lastMessage': instance.lastMessage,
      'lastMessageTimeStamp': instance.lastMessageTimeStamp,
      'notReadCnt': instance.notReadCnt,
      'chatStatus': instance.chatStatus,
    };
