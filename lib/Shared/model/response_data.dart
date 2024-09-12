

import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseData<T> {
  @JsonKey(name: "status", defaultValue: 500)
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  T data;

  ResponseData(
      {required this.status, required this.message, required this.data});

  factory ResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseDataFromJson(json, fromJsonT);

  ResponseData<T> copyWith({int? status, String? message, T? data}) {
    return ResponseData<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
