// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_certifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCertificationsResponse _$RequestCertificationsResponseFromJson(
        Map<String, dynamic> json) =>
    RequestCertificationsResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$RequestCertificationsResponseToJson(
        RequestCertificationsResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      certificationToken: json['certificationToken'] as String,
      certificationInfo: CertificationInfo.fromJson(
          json['certificationInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'certificationToken': instance.certificationToken,
      'certificationInfo': instance.certificationInfo,
    };

CertificationInfo _$CertificationInfoFromJson(Map<String, dynamic> json) =>
    CertificationInfo(
      username: json['username'] as String,
      birthDay: json['birthDay'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$CertificationInfoToJson(CertificationInfo instance) =>
    <String, dynamic>{
      'username': instance.username,
      'birthDay': instance.birthDay,
      'phone': instance.phone,
    };
