// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfo _$SchoolInfoFromJson(Map<String, dynamic> json) => SchoolInfo(
      schoolType: json['schoolType'] as String?,
      link: json['link'] as String?,
      schoolGubun: json['schoolGubun'] as String?,
      adres: json['adres'] as String,
      schoolName: json['schoolName'] as String,
      region: json['region'] as String,
      totalCount: json['totalCount'] as String,
      estType: json['estType'] as String,
      seq: json['seq'] as String,
    );

Map<String, dynamic> _$SchoolInfoToJson(SchoolInfo instance) =>
    <String, dynamic>{
      'schoolType': instance.schoolType,
      'link': instance.link,
      'schoolGubun': instance.schoolGubun,
      'adres': instance.adres,
      'schoolName': instance.schoolName,
      'region': instance.region,
      'totalCount': instance.totalCount,
      'estType': instance.estType,
      'seq': instance.seq,
    };
