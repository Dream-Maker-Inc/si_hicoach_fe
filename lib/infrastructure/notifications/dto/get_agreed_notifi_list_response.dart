import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';
part 'get_agreed_notifi_list_response.g.dart';

@JsonSerializable()
class GetAgreedNotifiListResponse extends BaseResponse<Data> {
  GetAgreedNotifiListResponse(
      {super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetAgreedNotifiListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAgreedNotifiListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAgreedNotifiListResponseToJson(this);
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
    required this.memberId,
    required this.type,
  });
  late final int id;
  late final int memberId;
  late final String type;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
