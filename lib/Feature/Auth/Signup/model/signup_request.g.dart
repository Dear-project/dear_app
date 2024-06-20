// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      birthDay: json['birthDay'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'birthDay': instance.birthDay,
      'type': instance.type,
    };
