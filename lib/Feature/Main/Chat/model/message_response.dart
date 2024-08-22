import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "roomId")
  String roomId;

  @JsonKey(name: "type")
  String type;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "timeStamp")
  String timeStamp;

  @JsonKey(name: "read")
  int read;

  @JsonKey(name: "chatStatus")
  String chatStatus;

  MessageResponse(this.id, this.roomId, this.type, this.userId, this.message,
      this.timeStamp, this.read, this.chatStatus);


  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}