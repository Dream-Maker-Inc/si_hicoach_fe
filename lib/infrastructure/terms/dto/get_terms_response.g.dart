// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_terms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTermsResponse _$GetTermsResponseFromJson(Map<String, dynamic> json) =>
    GetTermsResponse(
      json['ref'],
      (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['statusCode'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$GetTermsResponseToJson(GetTermsResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deletedAt'] as String?,
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
      json['isRequired'] as bool,
      MyAgreed.fromJson(json['myAgreed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'isRequired': instance.isRequired,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'myAgreed': instance.myAgreed,
    };

MyAgreed _$MyAgreedFromJson(Map<String, dynamic> json) => MyAgreed(
      json['id'] as int,
      json['memberId'] as int,
      json['serviceTermId'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deletedAt'] as String?,
    );

Map<String, dynamic> _$MyAgreedToJson(MyAgreed instance) => <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'serviceTermId': instance.serviceTermId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
