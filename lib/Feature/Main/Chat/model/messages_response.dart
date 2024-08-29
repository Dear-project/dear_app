import 'package:dear_app/Feature/Main/Chat/model/message_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_response.g.dart';

@JsonSerializable()
class MessagesResponse {
  @JsonKey(name: "firstMessageId")
  String firstMessageId;

  @JsonKey(name: "messages")
  List<MessageResponse> messages;

  MessagesResponse(this.firstMessageId, this.messages);

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesResponseToJson(this);
}