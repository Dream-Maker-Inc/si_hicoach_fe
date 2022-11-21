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
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      isRequired: json['isRequired'] as bool,
      myAgreed: json['myAgreed'] == null
          ? null
          : MyAgreed.fromJson(json['myAgreed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'isRequired': instance.isRequired,
      'myAgreed': instance.myAgreed,
    };

MyAgreed _$MyAgreedFromJson(Map<String, dynamic> json) => MyAgreed(
      id: json['id'] as int,
      memberId: json['memberId'] as int,
      serviceTermId: json['serviceTermId'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$MyAgreedToJson(MyAgreed instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'memberId': instance.memberId,
      'serviceTermId': instance.serviceTermId,
    };
