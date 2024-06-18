import 'package:json_annotation/json_annotation.dart';

part 'major_info.g.dart';

@JsonSerializable()
class MajorInfo {
  @JsonKey(name: "lClass")
  String lClass;
  @JsonKey(name: "facilName")
  String facilName;
  @JsonKey(name: "majorSeq")
  String majorSeq;

  @JsonKey(name: "mClass")
  String mClass;
  @JsonKey(name: "totalCount")
  String totalCount;

  MajorInfo(
      {required this.lClass,
      required this.facilName,
      required this.majorSeq,
      required this.mClass,
      required this.totalCount});

  factory MajorInfo.fromJson(Map<String, dynamic> json) =>
      _$MajorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MajorInfoToJson(this);
}
