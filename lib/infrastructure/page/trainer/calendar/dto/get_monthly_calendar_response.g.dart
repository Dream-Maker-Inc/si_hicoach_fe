// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_monthly_calendar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMonthlyCalendarResponse _$GetMonthlyCalendarResponseFromJson(
        Map<String, dynamic> json) =>
    GetMonthlyCalendarResponse(
      ref: json['ref'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMonthlyCalendarResponseToJson(
        GetMonthlyCalendarResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      date: DateTime.parse(json['date'] as String),
      personalStudyCount: json['personalStudyCount'] as int,
      memberStudyCount: json['memberStudyCount'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'personalStudyCount': instance.personalStudyCount,
      'memberStudyCount': instance.memberStudyCount,
    };
