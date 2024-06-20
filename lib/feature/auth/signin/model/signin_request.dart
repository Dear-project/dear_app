import 'package:json_annotation/json_annotation.dart';

part 'signin_request.g.dart';

@JsonSerializable()
class SignInRequest {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "password")
  String password;

  SignInRequest({required this.email, required this.password});

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
