import 'package:json_annotation/json_annotation.dart';

part 'register_major_request.g.dart';

@JsonSerializable()
class RegisterMajorRequest {
  @JsonKey(name: "majorSeq")
  String majorSeq;

  @JsonKey(name: "lclass")
  String lClass;

  @JsonKey(name: "mclass")
  String mClass;


  RegisterMajorRequest({required this.majorSeq, required this.lClass, required this.mClass});

  factory RegisterMajorRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterMajorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMajorRequestToJson(this);
}
