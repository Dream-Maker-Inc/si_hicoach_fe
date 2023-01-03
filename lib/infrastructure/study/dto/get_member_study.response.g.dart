// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_study.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudyResponse _$GetStudyResponseFromJson(Map<String, dynamic> json) =>
    GetStudyResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetStudyResponseToJson(GetStudyResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      trainerId: json['trainerId'] as int,
      memberId: json['memberId'] as int,
      memo: json['memo'] as String,
      totalTicketCount: json['totalTicketCount'] as int,
      totalStudyCount: json['totalStudyCount'] as int,
      lastStudyRound: json['lastStudyRound'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      trainer: Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
      exerciseGoals: (json['exerciseGoals'] as List<dynamic>)
          .map((e) => ExerciseGoals.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextStudyRound: json['nextStudyRound'] as int,
      availableTicketsCount: json['availableTicketsCount'] as int,
      isExistAvailableTicket: json['isExistAvailableTicket'] as bool,
      isPersonal: json['isPersonal'] as bool,
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'trainerId': instance.trainerId,
      'memberId': instance.memberId,
      'memo': instance.memo,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'lastStudyRound': instance.lastStudyRound,
      'member': instance.member,
      'trainer': instance.trainer,
      'exerciseGoals': instance.exerciseGoals,
      'nextStudyRound': instance.nextStudyRound,
      'availableTicketsCount': instance.availableTicketsCount,
      'isExistAvailableTicket': instance.isExistAvailableTicket,
      'isPersonal': instance.isPersonal,
      'study': instance.study,
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
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: json['id'] as int,
      name: json['name'] as String,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'companyName': instance.companyName,
    };

Study _$StudyFromJson(Map<String, dynamic> json) => Study(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      matchingId: json['matchingId'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      memo: json['memo'] as String,
      isDummy: json['isDummy'] as bool,
      myExercises: (json['myExercises'] as List<dynamic>)
          .map((e) => MyExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
      round: json['round'] as int,
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'matchingId': instance.matchingId,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'memo': instance.memo,
      'isDummy': instance.isDummy,
      'myExercises': instance.myExercises,
      'round': instance.round,
    };

MyExercises _$MyExercisesFromJson(Map<String, dynamic> json) => MyExercises(
      weight: json['weight'] as int,
      interval: json['interval'] as int,
      set: json['set'] as int,
      exerciseId: json['exerciseId'] as int,
      title: json['title'] as String,
      part: json['part'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MyExercisesToJson(MyExercises instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'interval': instance.interval,
      'set': instance.set,
      'exerciseId': instance.exerciseId,
      'title': instance.title,
      'part': instance.part,
      'type': instance.type,
    };
