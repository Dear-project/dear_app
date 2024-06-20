// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthNumberRequest _$EmailAuthNumberRequestFromJson(
        Map<String, dynamic> json) =>
    EmailAuthNumberRequest(
      email: json['email'] as String,
      authCode: json['AuthCode'] as String,
    );

Map<String, dynamic> _$EmailAuthNumberRequestToJson(
        EmailAuthNumberRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'AuthCode': instance.authCode,
    };
