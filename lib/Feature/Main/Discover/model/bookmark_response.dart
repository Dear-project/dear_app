import 'package:json_annotation/json_annotation.dart';

part 'bookmark_response.g.dart';

@JsonSerializable()
class BookmarkResponse {
  String? id;
  String name;
  String? content;
  String? type;

  BookmarkResponse(
      this.id,
      this.name,
      this.content,
      this.type
      );

  factory BookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkResponseToJson(this);
}