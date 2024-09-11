// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_school_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterSchoolRequest _$RegisterSchoolRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterSchoolRequest(
      seq: json['seq'] as String,
      schoolName: json['schoolName'] as String,
      link: json['link'] as String,
      adres: json['adres'] as String,
    );

Map<String, dynamic> _$RegisterSchoolRequestToJson(
        RegisterSchoolRequest instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'schoolName': instance.schoolName,
      'link': instance.link,
      'adres': instance.adres,
    };
