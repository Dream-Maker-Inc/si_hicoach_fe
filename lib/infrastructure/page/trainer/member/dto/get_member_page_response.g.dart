// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberPageResponse _$GetMemberPageResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberPageResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberPageResponseToJson(
        GetMemberPageResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      matching: Matching.fromJson(json['matching'] as Map<String, dynamic>),
      latestStudy: json['latestStudy'] == null
          ? null
          : LatestStudy.fromJson(json['latestStudy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'matching': instance.matching,
      'latestStudy': instance.latestStudy,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
      birthDay: json['birthDay'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
      ticketCount: json['ticketCount'] as int,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goals.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'ticketCount': instance.ticketCount,
      'goals': instance.goals,
      'memo': instance.memo,
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

LatestStudy _$LatestStudyFromJson(Map<String, dynamic> json) => LatestStudy(
      id: json['id'] as int,
      startedAt: json['startedAt'] as String,
      totalStudyCount: json['totalStudyCount'] as int,
    );

Map<String, dynamic> _$LatestStudyToJson(LatestStudy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt,
      'totalStudyCount': instance.totalStudyCount,
    };
