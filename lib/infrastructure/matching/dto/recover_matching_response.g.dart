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
      json['id'] as int,
      json['trainerId'] as int,
      json['memberId'] as int,
      json['memo'] as String,
      json['ticketCount'] as int,
      (json['goals'] as List<dynamic>)
          .map((e) => Goals.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deletedAt'] as String?,
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
      json['id'] as int,
      json['title'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deletedAt'] as String?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
    };
