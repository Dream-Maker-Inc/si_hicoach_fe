import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_exercise_goal_response.g.dart';

@JsonSerializable()
class GetExerciseGoalResponse extends BaseResponse<Data> {
  GetExerciseGoalResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetExerciseGoalResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExerciseGoalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetExerciseGoalResponseToJson(this);
}

@JsonSerializable()
class Data {
  MetaData metaData;
  List<Items> items;

  Data(this.metaData, this.items);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Items extends BaseDto {
  int id;
  String title;

  Items(
      {required this.id,
      required this.title,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
