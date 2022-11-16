// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyPageResponse _$GetMyPageResponseFromJson(Map<String, dynamic> json) =>
    GetMyPageResponse(
      ref: json['ref'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetMyPageResponseToJson(GetMyPageResponse instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      trainer: Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
      finishedStudiesCount: FinishedStudiesCount.fromJson(
          json['finishedStudiesCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'trainer': instance.trainer,
      'finishedStudiesCount': instance.finishedStudiesCount,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: json['id'] as int,
      name: json['name'] as String,
      trainerInfo:
          TrainerInfo.fromJson(json['trainerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'trainerInfo': instance.trainerInfo,
    };

TrainerInfo _$TrainerInfoFromJson(Map<String, dynamic> json) => TrainerInfo(
      companyName: json['companyName'] as String,
    );

Map<String, dynamic> _$TrainerInfoToJson(TrainerInfo instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
    };

FinishedStudiesCount _$FinishedStudiesCountFromJson(
        Map<String, dynamic> json) =>
    FinishedStudiesCount(
      lastMonth: json['lastMonth'] as int,
      thisMonthAtUntilToday: json['thisMonthAtUntilToday'] as int,
    );

Map<String, dynamic> _$FinishedStudiesCountToJson(
        FinishedStudiesCount instance) =>
    <String, dynamic>{
      'lastMonth': instance.lastMonth,
      'thisMonthAtUntilToday': instance.thisMonthAtUntilToday,
    };
