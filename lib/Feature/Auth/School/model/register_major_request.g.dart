// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_major_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterMajorRequest _$RegisterMajorRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterMajorRequest(
      majorSeq: json['majorSeq'] as String,
      lClass: json['lclass'] as String,
      mClass: json['mclass'] as String,
    );

Map<String, dynamic> _$RegisterMajorRequestToJson(
        RegisterMajorRequest instance) =>
    <String, dynamic>{
      'majorSeq': instance.majorSeq,
      'lclass': instance.lClass,
      'mclass': instance.mClass,
    };
