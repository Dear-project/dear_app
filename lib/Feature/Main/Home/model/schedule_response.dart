import 'package:json_annotation/json_annotation.dart';

part 'schedule_response.g.dart';

@JsonSerializable()
class ScheduleResponse {
  @JsonKey(name: "scheduler")
  String scheduler;

  @JsonKey(name: "date")
  String date;

  ScheduleResponse(
      this.scheduler,
      this.date,
      );

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}
