// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_memos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyMemosResponse _$GetMyMemosResponseFromJson(Map<String, dynamic> json) =>
    GetMyMemosResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMyMemosResponseToJson(GetMyMemosResponse instance) =>
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
      studyId: json['studyId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'studyId': instance.studyId,
      'createdAt': instance.createdAt.toIso8601String(),
      'memo': instance.memo,
    };
