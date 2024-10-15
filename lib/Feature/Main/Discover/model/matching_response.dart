import 'package:json_annotation/json_annotation.dart';

part 'matching_response.g.dart';

@JsonSerializable()
class MatchingResponse {
  int id;
  int userId;
  int professorId;
  String matchingType;
  String userName;
  String? schoolName;
  String? majorName;
  String? userProfileImage;

  MatchingResponse({required this.id, required this.userId, required this.professorId, required this.matchingType,
    required this.userName, this.schoolName, this.majorName, this.userProfileImage});

  factory MatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingResponseToJson(this);
}