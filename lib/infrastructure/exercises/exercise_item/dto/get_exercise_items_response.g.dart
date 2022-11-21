// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exercise_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExerciseItemsResponse _$GetExerciseItemsResponseFromJson(
        Map<String, dynamic> json) =>
    GetExerciseItemsResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetExerciseItemsResponseToJson(
        GetExerciseItemsResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ExerciseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'metaData': instance.metaData,
      'items': instance.items,
    };

ExerciseItem _$ExerciseItemFromJson(Map<String, dynamic> json) => ExerciseItem(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
      part: json['part'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ExerciseItemToJson(ExerciseItem instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
      'part': instance.part,
      'type': instance.type,
    };
