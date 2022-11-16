// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_matching_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMatchingResponse _$GetMatchingResponseFromJson(Map<String, dynamic> json) =>
    GetMatchingResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMatchingResponseToJson(
        GetMatchingResponse instance) =>
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
      trainerId: json['trainerId'] as int,
      memberId: json['memberId'] as int,
      memo: json['memo'] as String,
      ticketCount: json['ticketCount'] as int,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goals.fromJson(e as Map<String, dynamic>))
          .toList(),
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
