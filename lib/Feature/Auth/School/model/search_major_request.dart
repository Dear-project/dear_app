import 'package:json_annotation/json_annotation.dart';

part 'search_major_request.g.dart';

@JsonSerializable()
class SearchMajorRequest {
  @JsonKey(name: "keyword")
  String keyword;

  SearchMajorRequest({required this.keyword});

  factory SearchMajorRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchMajorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMajorRequestToJson(this);
}
