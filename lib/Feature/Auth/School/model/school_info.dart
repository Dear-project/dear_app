import 'package:json_annotation/json_annotation.dart';

part 'school_info.g.dart';

@JsonSerializable()
class SchoolInfo {

  @JsonKey(name: "schoolType")
  String schoolType;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "schoolGubun")
  String schoolGubun;
  @JsonKey(name: "adres")
  String adres;
  @JsonKey(name: "schoolName")
  String schoolName;
  @JsonKey(name: "region")
  String region;
  @JsonKey(name: "totalCount")
  String totalCount;
  @JsonKey(name: "estType")
  String estType;
  @JsonKey(name: "seq")
  String seq;

  SchoolInfo({required this.schoolType, required this.link,
  required this.schoolGubun, required this.adres, required this.schoolName, required this.region,
    required this.totalCount, required this.estType, required this.seq
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) =>
      _$SchoolInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolInfoToJson(this);
}
