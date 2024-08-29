// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomRequest _$RoomRequestFromJson(Map<String, dynamic> json) => RoomRequest(
      roomName: json['roomName'] as String,
      joinUserId: (json['joinUserId'] as num).toInt(),
    );

Map<String, dynamic> _$RoomRequestToJson(RoomRequest instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'joinUserId': instance.joinUserId,
    };
