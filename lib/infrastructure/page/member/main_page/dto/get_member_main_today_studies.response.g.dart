// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_main_today_studies.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberMainTodayStudiesResponse _$GetMemberMainTodayStudiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberMainTodayStudiesResponse(
      ref: json['ref'],
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberMainTodayStudiesResponseToJson(
        GetMemberMainTodayStudiesResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      round: json['round'] as int,
      matchingId: json['matchingId'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      memo: json['memo'] as String,
      myExercises: (json['myExercises'] as List<dynamic>)
          .map((e) => MyExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'round': instance.round,
      'matchingId': instance.matchingId,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'memo': instance.memo,
      'myExercises': instance.myExercises,
    };

MyExercises _$MyExercisesFromJson(Map<String, dynamic> json) => MyExercises(
      interval: json['interval'] as int,
      set: json['set'] as int,
      weight: json['weight'] as int,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyExercisesToJson(MyExercises instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'set': instance.set,
      'weight': instance.weight,
      'exercise': instance.exercise,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
      part: json['part'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
      'part': instance.part,
      'type': instance.type,
    };
