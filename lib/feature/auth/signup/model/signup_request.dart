import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "birthDay")
  String birthDay;

  @JsonKey(name: "userRole")
  String userRole;

  SignupRequest(
      {required this.email,
      required this.password,
      required this.name,
      required this.birthDay,
      required this.userRole});

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
