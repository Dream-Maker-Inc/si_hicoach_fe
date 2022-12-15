// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_members_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMembersPageResponse _$GetMembersPageResponseFromJson(
        Map<String, dynamic> json) =>
    GetMembersPageResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMembersPageResponseToJson(
        GetMembersPageResponse instance) =>
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
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      matching: Matching.fromJson(json['matching'] as Map<String, dynamic>),
      totalStudyCount: json['totalStudyCount'] as int,
      latestStudy: json['latestStudy'] == null
          ? null
          : LatestStudy.fromJson(json['latestStudy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'member': instance.member,
      'matching': instance.matching,
      'latestStudy': instance.latestStudy,
      'totalStudyCount': instance.totalStudyCount,
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      ticketCount: json['ticketCount'] as int,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'ticketCount': instance.ticketCount,
    };

LatestStudy _$LatestStudyFromJson(Map<String, dynamic> json) => LatestStudy(
      id: json['id'] as int,
      round: json['round'] as int,
      isFinished: json['isFinished'] as bool,
    );

Map<String, dynamic> _$LatestStudyToJson(LatestStudy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'isFinished': instance.isFinished,
    };
