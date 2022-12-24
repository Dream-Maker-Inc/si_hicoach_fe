// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_agreed_notifi_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAgreedNotifiListResponse _$GetAgreedNotifiListResponseFromJson(
        Map<String, dynamic> json) =>
    GetAgreedNotifiListResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetAgreedNotifiListResponseToJson(
        GetAgreedNotifiListResponse instance) =>
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
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: json['id'] as int,
      memberId: json['memberId'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'memberId': instance.memberId,
      'type': instance.type,
    };
