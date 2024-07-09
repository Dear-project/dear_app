import 'package:json_annotation/json_annotation.dart';

part 'post_id_response.g.dart';

@JsonSerializable()
class PostIDResponse {
  @JsonKey(name: "id")
  int id;

  PostIDResponse(this.id);


  factory PostIDResponse.fromJson(Map<String, dynamic> json) =>
      _$PostIDResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostIDResponseToJson(this);
}