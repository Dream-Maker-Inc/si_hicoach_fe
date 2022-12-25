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
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
      matching: Matching.fromJson(json['matching'] as Map<String, dynamic>),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'study': instance.study,
      'matching': instance.matching,
      'member': instance.member,
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

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
