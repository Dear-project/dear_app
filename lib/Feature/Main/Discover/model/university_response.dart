import 'package:json_annotation/json_annotation.dart';

part 'university_response.g.dart';

@JsonSerializable()
class UniversityResponse {
  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "image")
  String? img;

  UniversityResponse(
      this.name,
      this.img
      );

  factory UniversityResponse.fromJson(Map<String, dynamic> json) =>
      _$UniversityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityResponseToJson(this);
}