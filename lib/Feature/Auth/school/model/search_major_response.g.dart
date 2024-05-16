// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_major_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMajorResponse _$SearchMajorResponseFromJson(Map<String, dynamic> json) =>
    SearchMajorResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MajorInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchMajorResponseToJson(
        SearchMajorResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
