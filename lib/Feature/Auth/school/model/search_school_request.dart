import 'package:json_annotation/json_annotation.dart';

part 'search_school_request.g.dart';

@JsonSerializable()
class SearchSchoolRequest {

  @JsonKey(name: "gubunType")
  String gubunType;

  @JsonKey(name: "keyword")
  String keyword;

  SearchSchoolRequest({required this.gubunType, required this.keyword});

  factory SearchSchoolRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchSchoolRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSchoolRequestToJson(this);
}