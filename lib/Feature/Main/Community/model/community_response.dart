import 'package:json_annotation/json_annotation.dart';

part 'community_response.g.dart';

@JsonSerializable()
class CommunityResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "createdDateTime")
  String? createdDateTime;

  @JsonKey(name: "modifiedDateTime")
  String? modifiedDateTime;

  @JsonKey(name: "imagePath")
  String? imagePath;

  @JsonKey(name: "profileImage")
  String? profileImage;

  CommunityResponse(this.id, this.userId, this.title, this.content, this.createdDateTime,
      this.modifiedDateTime, this.imagePath, this.profileImage);

  factory CommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityResponseToJson(this);
}