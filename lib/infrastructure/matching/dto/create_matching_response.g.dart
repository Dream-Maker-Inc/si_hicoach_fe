// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_matching_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMatchingResponse _$CreateMatchingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateMatchingResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateMatchingResponseToJson(
        CreateMatchingResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      trainerId: json['trainerId'] as int,
      memberId: json['memberId'] as int,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goals.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
      totalTicketCount: json['totalTicketCount'] as int,
      totalStudyCount: json['totalStudyCount'] as int,
      deletedAt: json['deletedAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'trainerId': instance.trainerId,
      'memberId': instance.memberId,
      'goals': instance.goals,
      'memo': instance.memo,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
    };
