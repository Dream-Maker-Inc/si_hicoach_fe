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
      matching: json['matching'] == null
          ? null
          : Matching.fromJson(json['matching'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'matching': instance.matching,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
      totalTicketCount: json['totalTicketCount'] as int,
      totalStudyCount: json['totalStudyCount'] as int,
      lastStudyRound: json['lastStudyRound'] as int,
      nextStudyRound: json['nextStudyRound'] as int,
      isPersonal: json['isPersonal'] as bool,
      availableTicketsCount: json['availableTicketsCount'] as int,
      trainer: Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'lastStudyRound': instance.lastStudyRound,
      'nextStudyRound': instance.nextStudyRound,
      'isPersonal': instance.isPersonal,
      'availableTicketsCount': instance.availableTicketsCount,
      'trainer': instance.trainer,
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
