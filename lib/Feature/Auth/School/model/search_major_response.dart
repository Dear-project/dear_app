import 'package:dear_app/Feature/Auth/school/model/major_info.dart';
import 'package:dear_app/Feature/Auth/school/model/school_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_major_response.g.dart';

@JsonSerializable()
class SearchMajorResponse {

  @JsonKey(name: "data", defaultValue: [])
  List<MajorInfo> data;


  SearchMajorResponse({required this.data});

  factory SearchMajorResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMajorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMajorResponseToJson(this);
}