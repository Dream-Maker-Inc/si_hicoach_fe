// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      json['offset'] as int,
      json['pageSize'] as int,
      json['pageNumber'] as int,
      json['totalPageCount'] as int,
      json['itemCount'] as int,
      json['totalItemCount'] as int,
      json['isFirst'] as bool,
      json['isLast'] as bool,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'offset': instance.offset,
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'totalPageCount': instance.totalPageCount,
      'itemCount': instance.itemCount,
      'totalItemCount': instance.totalItemCount,
      'isFirst': instance.isFirst,
      'isLast': instance.isLast,
    };
