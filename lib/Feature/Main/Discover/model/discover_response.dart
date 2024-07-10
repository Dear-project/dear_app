import 'package:json_annotation/json_annotation.dart';

part 'discover_response.g.dart';

@JsonSerializable()
class DiscoverResponse {
  @JsonKey(name: "professorId")
  int professorId;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "school")
  String school;

  @JsonKey(name: "major")
  String major;

  @JsonKey(name: "profileImage")
  String profileImage;

  DiscoverResponse(
      this.professorId,
      this.name,
      this.school,
      this.major,
      this.profileImage
      );

  factory DiscoverResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoverResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverResponseToJson(this);
}

