
import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class Authentication {

  @JsonKey(name: "accessToken")
  String accessToken;

  @JsonKey(name: "refreshToken")
  String refreshToken;


  Authentication({required this.accessToken, required this.refreshToken});

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}