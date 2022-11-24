import 'package:json_annotation/json_annotation.dart';
part 'find_id_response.g.dart';

@JsonSerializable()
class FindIdResponse {
  dynamic ref;
  String data;
  String statusCode;
  String message;

  FindIdResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory FindIdResponse.fromJson(Map<String, dynamic> json) =>
      _$FindIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FindIdResponseToJson(this);
}
