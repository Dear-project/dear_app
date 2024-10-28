import 'package:json_annotation/json_annotation.dart';

part 'discover_response.g.dart';

@JsonSerializable()
class DiscoverResponse {
  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "school")
  String? school;

  @JsonKey(name: "major")
  String? major;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "profileImage")
  String? profileImage;

  @JsonKey(name: "isBookMarked")
  bool? isBookMarked;

  DiscoverResponse(
      this.userId,
      this.name,
      this.school,
      this.major,
      this.profileImage,
      this.isBookMarked
      );

  factory DiscoverResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoverResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverResponseToJson(this);
}

