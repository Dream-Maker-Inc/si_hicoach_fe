// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyInfoResponse _$GetMyInfoResponseFromJson(Map<String, dynamic> json) =>
    GetMyInfoResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMyInfoResponseToJson(GetMyInfoResponse instance) =>
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
      trainer: json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'matching': instance.matching,
      'trainer': instance.trainer,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      birthDay: json['birthDay'] as String,
      phone: json['phone'] as String,
      trainerInfo: json['trainerInfo'] == null
          ? null
          : TrainerInfo.fromJson(json['trainerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'phone': instance.phone,
      'trainerInfo': instance.trainerInfo,
    };

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      birthDay: json['birthDay'] as String,
      phone: json['phone'] as String,
      trainerInfo:
          TrainerInfo.fromJson(json['trainerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'phone': instance.phone,
      'trainerInfo': instance.trainerInfo,
    };

TrainerInfo _$TrainerInfoFromJson(Map<String, dynamic> json) => TrainerInfo(
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$TrainerInfoToJson(TrainerInfo instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
    };
