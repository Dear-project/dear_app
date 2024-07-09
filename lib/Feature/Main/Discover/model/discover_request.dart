import 'package:json_annotation/json_annotation.dart';

part 'discover_request.g.dart';

@JsonSerializable()
class DiscoverRequest {
  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "size")
  int size;

  DiscoverRequest({required this.page, required this.size});

  factory DiscoverRequest.fromJson(Map<String, dynamic> json) =>
      _$DiscoverRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverRequestToJson(this);
}
