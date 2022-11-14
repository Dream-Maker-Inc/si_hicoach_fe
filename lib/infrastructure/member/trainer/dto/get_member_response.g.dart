// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemberResponse _$GetMemberResponseFromJson(Map<String, dynamic> json) =>
    GetMemberResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMemberResponseToJson(GetMemberResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
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
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'phone': instance.phone,
      'deletedAt': instance.deletedAt,
    };
