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
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
    )..matching = Matching.fromJson(json['matching'] as Map<String, dynamic>);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'study': instance.study,
      'matching': instance.matching,
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
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      round: json['round'] as int,
      matchingId: json['matchingId'] as int,
      startedAt: json['startedAt'] as String,
      endedAt: json['endedAt'] as String,
      memo: json['memo'] as String,
      myExercises: (json['myExercises'] as List<dynamic>)
          .map((e) => MyExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFinished: json['isFinished'] as bool,
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'round': instance.round,
      'matchingId': instance.matchingId,
      'startedAt': instance.startedAt,
      'endedAt': instance.endedAt,
      'memo': instance.memo,
      'myExercises': instance.myExercises,
      'isFinished': instance.isFinished,
    };

MyExercises _$MyExercisesFromJson(Map<String, dynamic> json) => MyExercises(
      weight: json['weight'] as int,
      interval: json['interval'] as int,
      set: json['set'] as int,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyExercisesToJson(MyExercises instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'interval': instance.interval,
      'set': instance.set,
      'exercise': instance.exercise,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as int,
      title: json['title'] as String,
      part: json['part'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'part': instance.part,
      'type': instance.type,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
      ticketCount: json['ticketCount'] as int,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'ticketCount': instance.ticketCount,
    };
