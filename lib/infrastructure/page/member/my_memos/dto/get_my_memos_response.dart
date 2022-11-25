import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_my_memos_response.g.dart';

@JsonSerializable()
class GetMyMemosResponse extends BaseResponse<Data> {
  GetMyMemosResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMyMemosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyMemosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyMemosResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.metaData,
    required this.items,
  });
  late final MetaData metaData;
  late final List<Items> items;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    required this.studyId,
    required this.createdAt,
    required this.memo,
  });
  late final int studyId;
  late final DateTime createdAt;
  late final String memo;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
