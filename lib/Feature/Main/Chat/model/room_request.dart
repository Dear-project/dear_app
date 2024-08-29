import 'package:json_annotation/json_annotation.dart';

part 'room_request.g.dart';

@JsonSerializable()
class RoomRequest {
  @JsonKey(name: "roomName")
  String roomName;

  @JsonKey(name: "joinUserId")
  int joinUserId;

  RoomRequest({required this.roomName, required this.joinUserId});

  factory RoomRequest.fromJson(Map<String, dynamic> json) =>
      _$RoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RoomRequestToJson(this);
}