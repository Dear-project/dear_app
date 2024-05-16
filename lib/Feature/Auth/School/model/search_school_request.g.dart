// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_school_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSchoolRequest _$SearchSchoolRequestFromJson(Map<String, dynamic> json) =>
    SearchSchoolRequest(
      gubunType: json['gubunType'] as String,
      keyword: json['keyword'] as String,
    );

Map<String, dynamic> _$SearchSchoolRequestToJson(
        SearchSchoolRequest instance) =>
    <String, dynamic>{
      'gubunType': instance.gubunType,
      'keyword': instance.keyword,
    };
