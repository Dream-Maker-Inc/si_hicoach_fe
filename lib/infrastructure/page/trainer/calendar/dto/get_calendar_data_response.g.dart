// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_calendar_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCalendarDataResponse _$GetCalendarDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetCalendarDataResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetCalendarDataResponseToJson(
        GetCalendarDataResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'metaData': instance.metaData,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as int,
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'member': instance.member,
      'study': instance.study,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Study _$StudyFromJson(Map<String, dynamic> json) => Study(
      id: json['id'] as int,
      round: json['round'] as int,
      memo: json['memo'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'memo': instance.memo,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
    };
