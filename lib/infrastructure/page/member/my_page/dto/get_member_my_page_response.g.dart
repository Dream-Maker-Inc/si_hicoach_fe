// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_my_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberMyPageResponse _$GetMemberMyPageResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberMyPageResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberMyPageResponseToJson(
        GetMemberMyPageResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      totalStudyCount: json['totalStudyCount'] as int,
      latestStudy: json['latestStudy'] == null
          ? null
          : LatestStudy.fromJson(json['latestStudy'] as Map<String, dynamic>),
      matching: json['matching'] == null
          ? null
          : Matching.fromJson(json['matching'] as Map<String, dynamic>),
      trainer: json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'totalStudyCount': instance.totalStudyCount,
      'latestStudy': instance.latestStudy,
      'matching': instance.matching,
      'trainer': instance.trainer,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

LatestStudy _$LatestStudyFromJson(Map<String, dynamic> json) => LatestStudy(
      id: json['id'] as int,
      round: json['round'] as int,
    );

Map<String, dynamic> _$LatestStudyToJson(LatestStudy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
      ticketCount: json['ticketCount'] as int,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'ticketCount': instance.ticketCount,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: json['id'] as int,
      name: json['name'] as String,
      companyName: json['companyName'] as String,
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'companyName': instance.companyName,
    };
