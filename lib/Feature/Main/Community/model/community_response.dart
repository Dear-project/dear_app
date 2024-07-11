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
    if(createdDateTime != null)  {
      final localdatetime = createdDateTime!.split('T');
      final date = localdatetime.first.split('-');
      final time = localdatetime.last.substring(0, localdatetime.last.lastIndexOf('.')).split(':');

      return "${date[0]}년 ${date[1]}월 ${date[2]}일 ${(int.parse(time[0]) / 12) < 1 ? "오전" : "오후"} ${int.parse(time[0]) % 12}:${time[1]}";
    } else {
      return "날짜를 불러올 수 없습니다.";
    }
  }

}