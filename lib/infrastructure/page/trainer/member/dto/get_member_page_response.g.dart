// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberPageResponse _$GetMemberPageResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberPageResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberPageResponseToJson(
        GetMemberPageResponse instance) =>
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
      memo: json['memo'] as String,
      exerciseGoals: (json['exerciseGoals'] as List<dynamic>)
          .map((e) => ExerciseGoals.fromJson(e as Map<String, dynamic>))
          .toList(),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      latestStudy: json['latestStudy'] == null
          ? null
          : LatestStudy.fromJson(json['latestStudy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'nextStudyRound': instance.nextStudyRound,
      'isPersonal': instance.isPersonal,
      'availableTicketsCount': instance.availableTicketsCount,
      'memo': instance.memo,
      'exerciseGoals': instance.exerciseGoals,
      'member': instance.member,
      'latestStudy': instance.latestStudy,
    };

ExerciseGoals _$ExerciseGoalsFromJson(Map<String, dynamic> json) =>
    ExerciseGoals(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ExerciseGoalsToJson(ExerciseGoals instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
      birthDay: json['birthDay'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
    };

LatestStudy _$LatestStudyFromJson(Map<String, dynamic> json) => LatestStudy(
      id: json['id'] as int,
      round: json['round'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
    );

Map<String, dynamic> _$LatestStudyToJson(LatestStudy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
    };
