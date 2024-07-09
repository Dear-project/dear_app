// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverRequest _$DiscoverRequestFromJson(Map<String, dynamic> json) =>
    DiscoverRequest(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$DiscoverRequestToJson(DiscoverRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };
