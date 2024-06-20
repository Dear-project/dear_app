import 'package:json_annotation/json_annotation.dart';

part 'register_school_request.g.dart';

@JsonSerializable()
class RegisterSchoolRequest {
  @JsonKey(name: "seq")
  String seq;

  @JsonKey(name: "schoolName")
  String schoolName;

  RegisterSchoolRequest({required this.seq, required this.schoolName});

  factory RegisterSchoolRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterSchoolRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterSchoolRequestToJson(this);
}
