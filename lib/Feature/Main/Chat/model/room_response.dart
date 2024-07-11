import 'package:json_annotation/json_annotation.dart';

part 'room_response.g.dart';

@JsonSerializable()
class RoomResponse {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "adminId")
  int adminId;

  @JsonKey(name: "chatName")
  String chatName;

  @JsonKey(name: "createdAt")
  String createdAt;

  @JsonKey(name: "joinedUserId")
  String? joinedUserId;

  @JsonKey(name: "createdDateTime")
  String? createdDateTime;

  @JsonKey(name: "lastMessage")
  String lastMessage;

  @JsonKey(name: "lastMessageTimeStamp")
  String lastMessageTimeStamp;

  @JsonKey(name: "notReadCnt")
  int notReadCnt;

  @JsonKey(name: "chatStatus")
  String chatStatus;


  RoomResponse(
      this.id,
      this.adminId,
      this.chatName,
      this.createdAt,
      this.joinedUserId,
      this.createdDateTime,
      this.lastMessage,
      this.lastMessageTimeStamp,
      this.notReadCnt,
      this.chatStatus);

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomResponseToJson(this);

}