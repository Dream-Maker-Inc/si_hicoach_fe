// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_studies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberStudiesResponse _$GetMemberStudiesResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberStudiesResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberStudiesResponseToJson(
        GetMemberStudiesResponse instance) =>
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
      round: json['round'] as int,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      myExercises: (json['myExercises'] as List<dynamic>)
          .map((e) => MyExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'myExercises': instance.myExercises,
      'memo': instance.memo,
    };

MyExercises _$MyExercisesFromJson(Map<String, dynamic> json) => MyExercises(
      weight: json['weight'] as int,
      interval: json['interval'] as int,
      set: json['set'] as int,
      title: json['title'] as String,
      part: json['part'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MyExercisesToJson(MyExercises instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'interval': instance.interval,
      'set': instance.set,
      'title': instance.title,
      'part': instance.part,
      'type': instance.type,
    };
