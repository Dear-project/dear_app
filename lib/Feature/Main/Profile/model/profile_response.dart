
import 'package:dear_app/Feature/Main/Profile/model/profile_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {

  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  ProfileInfo data;


  ProfileResponse({required this.status, required this.message, required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}