// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      (json['commentId'] as num).toInt(),
      json['content'] as String,
      json['commentor'] as String,
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'commentor': instance.commentor,
    };
