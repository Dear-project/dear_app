// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
