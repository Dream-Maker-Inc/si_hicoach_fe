// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_holiday_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHolidayResponse _$GetHolidayResponseFromJson(Map<String, dynamic> json) =>
    GetHolidayResponse(
      ref: json['ref'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetHolidayResponseToJson(GetHolidayResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      isSubstitueHoliday: json['isSubstitueHoliday'] as bool,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'isSubstitueHoliday': instance.isSubstitueHoliday,
    };
