import 'package:json_annotation/json_annotation.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "url")
  String? url;

  @JsonKey(name: "imagePath")
  String? imgPath;

  BannerResponse(
      this.id,
      this.title,
      this.url,
      this.imgPath
      );

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}