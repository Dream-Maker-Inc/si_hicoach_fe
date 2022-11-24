import 'package:json_annotation/json_annotation.dart';

part 'validate_response.g.dart';

@JsonSerializable()
class ValidateResponse {
  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  ValidateResponse(this.ref, this.data, this.statusCode, this.message);

  factory ValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateResponseToJson(this);
}

@JsonSerializable()
class Data {
  late final bool isValid;

  Data(this.isValid);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
