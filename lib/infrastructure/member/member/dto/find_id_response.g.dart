// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindIdResponse _$FindIdResponseFromJson(Map<String, dynamic> json) =>
    FindIdResponse(
      ref: json['ref'],
      data: json['data'] as String,
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FindIdResponseToJson(FindIdResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
