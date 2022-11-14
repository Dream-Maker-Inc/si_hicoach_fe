// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_of_trainer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberOfTrainerResponse _$GetMemberOfTrainerResponseFromJson(
        Map<String, dynamic> json) =>
    GetMemberOfTrainerResponse(
      json['ref'],
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['statusCode'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$GetMemberOfTrainerResponseToJson(
        GetMemberOfTrainerResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Member.fromJson(json['member'] as Map<String, dynamic>),
      json['matching'] == null
          ? null
          : Matching.fromJson(json['matching'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'matching': instance.matching,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      json['id'] as int,
      json['email'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      json['id'] as int,
      json['isPast'] as bool,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'isPast': instance.isPast,
    };
