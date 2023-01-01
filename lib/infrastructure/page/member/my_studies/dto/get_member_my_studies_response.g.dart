// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_my_studies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberMyStudiesResponse _$GetMemberMyStudiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberMyStudiesResponse(
      ref: json['ref'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberMyStudiesResponseToJson(
        GetMemberMyStudiesResponse instance) =>
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
      studies: (json['studies'] as List<dynamic>)
          .map((e) => Studies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'nextStudyRound': instance.nextStudyRound,
      'isPersonal': instance.isPersonal,
      'availableTicketsCount': instance.availableTicketsCount,
      'studies': instance.studies,
    };

Studies _$StudiesFromJson(Map<String, dynamic> json) => Studies(
      id: json['id'] as int,
      round: json['round'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
    )..matchingId = json['matchingId'] as int;

Map<String, dynamic> _$StudiesToJson(Studies instance) => <String, dynamic>{
      'id': instance.id,
      'matchingId': instance.matchingId,
      'round': instance.round,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
    };
