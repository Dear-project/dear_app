import 'package:json_annotation/json_annotation.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse {

  @JsonKey(name: "commentId")
  int commentId;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "commentor")
  String commentor;

  CommentResponse(this.commentId, this.content, this.commentor);

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}