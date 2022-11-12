// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      json['ref'],
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['statusCode'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      Member.fromJson(json['member'] as Map<String, dynamic>),
      (json['agreedTerms'] as List<dynamic>)
          .map((e) => AgreedTerms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'member': instance.member,
      'agreedTerms': instance.agreedTerms,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      json['email'] as String,
      json['name'] as String,
      json['gender'] as String,
      json['birthDay'] as String,
      json['phone'] as String,
      Password.fromJson(json['password'] as Map<String, dynamic>),
      json['trainerInfo'] == null
          ? null
          : TrainerInfo.fromJson(json['trainerInfo'] as Map<String, dynamic>),
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['id'] as int,
      json['deletedAt'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'phone': instance.phone,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'trainerInfo': instance.trainerInfo,
    };

Password _$PasswordFromJson(Map<String, dynamic> json) => Password(
      json['value'] as String,
    );

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'value': instance.value,
    };

TrainerInfo _$TrainerInfoFromJson(Map<String, dynamic> json) => TrainerInfo(
      json['companyName'] as String,
    );

Map<String, dynamic> _$TrainerInfoToJson(TrainerInfo instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
    };

AgreedTerms _$AgreedTermsFromJson(Map<String, dynamic> json) => AgreedTerms(
      json['memberId'] as int,
      json['serviceTermId'] as int,
      json['id'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deletedAt'] as String?,
    );

Map<String, dynamic> _$AgreedTermsToJson(AgreedTerms instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'serviceTermId': instance.serviceTermId,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
