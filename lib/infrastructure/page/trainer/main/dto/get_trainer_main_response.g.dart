// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trainer_main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrainerMainResponse _$GetTrainerMainResponseFromJson(
        Map<String, dynamic> json) =>
    GetTrainerMainResponse(
      ref: json['ref'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetTrainerMainResponseToJson(
        GetTrainerMainResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      totalTicketCount: json['totalTicketCount'] as int,
      totalStudyCount: json['totalStudyCount'] as int,
      nextStudyRound: json['nextStudyRound'] as int,
      isPersonal: json['isPersonal'] as bool,
      availableTicketsCount: json['availableTicketsCount'] as int,
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'nextStudyRound': instance.nextStudyRound,
      'isPersonal': instance.isPersonal,
      'availableTicketsCount': instance.availableTicketsCount,
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
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
    };
