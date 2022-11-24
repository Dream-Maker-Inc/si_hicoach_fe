import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'request_certifications_response.g.dart';

@JsonSerializable()
class RequestCertificationsResponse extends BaseResponse<Data> {
  RequestCertificationsResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory RequestCertificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestCertificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCertificationsResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.certificationToken,
    required this.certificationInfo,
  });
  late final String certificationToken;
  late final CertificationInfo certificationInfo;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CertificationInfo {
  CertificationInfo({
    required this.username,
    required this.birthDay,
    required this.phone,
  });
  late final String username;
  late final String birthDay;
  late final String phone;

  factory CertificationInfo.fromJson(Map<String, dynamic> json) =>
      _$CertificationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationInfoToJson(this);
}
