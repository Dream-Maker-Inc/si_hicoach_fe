// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tickets_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTicketsInfoResponse _$GetTicketsInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetTicketsInfoResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetTicketsInfoResponseToJson(
        GetTicketsInfoResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      finishedStudyCount: json['finishedStudyCount'] as int,
      remainingTicketCount: json['remainingTicketCount'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'finishedStudyCount': instance.finishedStudyCount,
      'remainingTicketCount': instance.remainingTicketCount,
    };
