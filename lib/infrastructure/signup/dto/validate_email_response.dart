import 'package:json_annotation/json_annotation.dart';

part 'validate_email_response.g.dart';

@JsonSerializable()
class ValidateEmailResponse {
  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  ValidateEmailResponse(this.ref, this.data, this.statusCode, this.message);

  factory ValidateEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateEmailResponseToJson(this);
}

@JsonSerializable()
class Data {
  late final bool isValid;

  Data(this.isValid);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
