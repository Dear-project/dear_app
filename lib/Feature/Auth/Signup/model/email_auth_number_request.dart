import 'package:json_annotation/json_annotation.dart';

part 'email_auth_number_request.g.dart';

@JsonSerializable()
class EmailAuthNumberRequest {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "authCode")
  String authCode;

  EmailAuthNumberRequest({required this.email, required this.authCode});

  factory EmailAuthNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailAuthNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAuthNumberRequestToJson(this);
}