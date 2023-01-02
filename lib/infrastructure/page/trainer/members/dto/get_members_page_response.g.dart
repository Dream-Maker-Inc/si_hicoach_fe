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
      id: json['id'] as int,
      totalTicketCount: json['totalTicketCount'] as int,
      totalStudyCount: json['totalStudyCount'] as int,
      nextStudyRound: json['nextStudyRound'] as int,
      isPersonal: json['isPersonal'] as bool,
      availableTicketsCount: json['availableTicketsCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'totalTicketCount': instance.totalTicketCount,
      'totalStudyCount': instance.totalStudyCount,
      'nextStudyRound': instance.nextStudyRound,
      'isPersonal': instance.isPersonal,
      'availableTicketsCount': instance.availableTicketsCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'member': instance.member,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      name: json['name'] as String,
      isRoleTrainer: json['isRoleTrainer'] as bool,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRoleTrainer': instance.isRoleTrainer,
    };
