import 'package:json_annotation/json_annotation.dart';

part 'message_request.g.dart';

@JsonSerializable()
class MessageRequest {
  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "size")
  int size;

  @JsonKey(name: "sort", defaultValue: [])
  List<String>? sort;

  MessageRequest({required this.page, required this.size, this.sort});



  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}