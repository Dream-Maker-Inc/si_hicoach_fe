// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weekly_calendar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeeklyCalendarResponse _$GetWeeklyCalendarResponseFromJson(
        Map<String, dynamic> json) =>
    GetWeeklyCalendarResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetWeeklyCalendarResponseToJson(
        GetWeeklyCalendarResponse instance) =>
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
      week: json['week'] as int,
      studies: (json['studies'] as List<dynamic>)
          .map((e) => Studies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'week': instance.week,
      'studies': instance.studies,
    };

Studies _$StudiesFromJson(Map<String, dynamic> json) => Studies(
      study: Study.fromJson(json['study'] as Map<String, dynamic>),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      weekDay: json['weekDay'] as int,
    )..isPersonal = json['isPersonal'] as bool;

Map<String, dynamic> _$StudiesToJson(Studies instance) => <String, dynamic>{
      'study': instance.study,
      'member': instance.member,
      'isPersonal': instance.isPersonal,
      'weekDay': instance.weekDay,
    };

Study _$StudyFromJson(Map<String, dynamic> json) => Study(
      id: json['id'] as int,
      matchingId: json['matchingId'] as int,
      round: json['round'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      myExercises: (json['myExercises'] as List<dynamic>)
          .map((e) => MyExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
      isFinished: json['isFinished'] as bool,
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'id': instance.id,
      'matchingId': instance.matchingId,
      'round': instance.round,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'myExercises': instance.myExercises,
      'memo': instance.memo,
      'isFinished': instance.isFinished,
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

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
