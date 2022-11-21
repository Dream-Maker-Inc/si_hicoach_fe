import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_inbodies_response.g.dart';

@JsonSerializable()
class GetInbodiesResponse extends BaseResponse<Data> {
  GetInbodiesResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetInbodiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInbodiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetInbodiesResponseToJson(this);
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
class Items extends BaseDto {
  Items({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.registDate,
    required this.imageKey,
    required this.imageUrl,
  });
  late final int id;
  late final String registDate;
  late final String imageKey;
  late final String imageUrl;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
