import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_response.g.dart';

@JsonSerializable()
class CommunityResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "userName")
  String userName;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "createdDateTime")
  String? createdDateTime;

  @JsonKey(name: "modifiedDateTime")
  String? modifiedDateTime;

  @JsonKey(name: "comment")
  int? commentCnt;

  @JsonKey(name: "imagePath")
  dynamic imagePath;

  @JsonKey(name: "profileImage")
  String? profileImage;


  CommunityResponse(
      this.id,
      this.userId,
      this.userName,
      this.title,
      this.content,
      this.createdDateTime,
      this.modifiedDateTime,
      this.imagePath,
      this.profileImage);

  factory CommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityResponseToJson(this);

  String getDate() {
      return createdDateTime != null ? DateFormat("yyyy년 M월 d일 a h시 m분", "ko").format(
          DateTime.parse(createdDateTime!)) : "날짜를 불러올 수 없습니다";
  }

  String getTime() {
    return createdDateTime != null ? DateFormat("yyyy.MM.dd.", "ko").format(
        DateTime.parse(createdDateTime!)) : "날짜를 불러올 수 없습니다";
  }

}