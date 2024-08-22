// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      json['id'] as String,
      json['roomId'] as String,
      json['type'] as String,
      (json['userId'] as num).toInt(),
      json['message'] as String,
      json['timeStamp'] as String,
      (json['read'] as num).toInt(),
      json['chatStatus'] as String,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'type': instance.type,
      'userId': instance.userId,
      'message': instance.message,
      'timeStamp': instance.timeStamp,
      'read': instance.read,
      'chatStatus': instance.chatStatus,
    };
