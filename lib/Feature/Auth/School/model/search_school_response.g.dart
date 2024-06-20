// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_school_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSchoolResponse _$SearchSchoolResponseFromJson(
        Map<String, dynamic> json) =>
    SearchSchoolResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SchoolInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchSchoolResponseToJson(
        SearchSchoolResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
