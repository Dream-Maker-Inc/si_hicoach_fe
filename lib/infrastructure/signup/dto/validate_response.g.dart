// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateResponse _$ValidateResponseFromJson(Map<String, dynamic> json) =>
    ValidateResponse(
      json['ref'],
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['statusCode'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$ValidateResponseToJson(ValidateResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['isValid'] as bool,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'isValid': instance.isValid,
    };
