import 'package:dear_app/feature/auth/school/model/school_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_school_response.g.dart';

@JsonSerializable()
class SearchSchoolResponse {

  @JsonKey(name: "data", defaultValue: [])
  List<SchoolInfo> data;


  SearchSchoolResponse({required this.data});

  factory SearchSchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSchoolResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSchoolResponseToJson(this);
}