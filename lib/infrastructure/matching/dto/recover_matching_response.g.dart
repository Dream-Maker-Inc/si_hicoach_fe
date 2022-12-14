// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_matching_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverMatchingResponse _$RecoverMatchingResponseFromJson(
        Map<String, dynamic> json) =>
    RecoverMatchingResponse(
      json['ref'],
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['statusCode'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$RecoverMatchingResponseToJson(
        RecoverMatchingResponse instance) =>
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
      ticketCount: json['ticketCount'] as int,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goals.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'trainerId': instance.trainerId,
      'memberId': instance.memberId,
      'memo': instance.memo,
      'ticketCount': instance.ticketCount,
      'goals': instance.goals,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      id: json['id'] as int,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
    };
