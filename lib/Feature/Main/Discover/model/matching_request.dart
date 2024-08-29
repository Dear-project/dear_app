import 'package:json_annotation/json_annotation.dart';

part 'matching_request.g.dart';

@JsonSerializable()
class MatchingRequest {
  @JsonKey(name: "subjectId")
  int? subjectId;

  MatchingRequest({required this.subjectId});

  factory MatchingRequest.fromJson(Map<String, dynamic> json) =>
      _$MatchingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingRequestToJson(this);
}
