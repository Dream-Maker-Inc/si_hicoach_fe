import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_exercise_items_response.g.dart';

@JsonSerializable()
class GetExerciseItemsResponse extends BaseResponse<Data> {
  GetExerciseItemsResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetExerciseItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExerciseItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetExerciseItemsResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.metaData,
    required this.items,
  });
  late final MetaData metaData;
  late final List<ExerciseItem> items;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ExerciseItem extends BaseDto {
  ExerciseItem({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.title,
    required this.part,
    required this.type,
  });
  late final int id;
  late final String title;
  late final String part;
  late final String type;

  factory ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
