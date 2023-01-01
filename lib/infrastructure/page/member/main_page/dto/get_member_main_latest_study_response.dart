import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_member_main_latest_study_response.g.dart';

@JsonSerializable()
class GetMemberMainLatestStudyResponse extends BaseResponse<Data> {
  GetMemberMainLatestStudyResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMemberMainLatestStudyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMemberMainLatestStudyResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMemberMainLatestStudyResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  Data({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.matchingId,
    required this.round,
    required this.startedAt,
    required this.endedAt,
    required this.memo,
    required this.myExercises,
  });
  late final int id;
  late final int matchingId;
  late final int round;
  late final DateTime startedAt;
  late final DateTime endedAt;
  late final String memo;
  late final List<MyExercises> myExercises;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class MyExercises {
  MyExercises({
    required this.interval,
    required this.set,
    required this.weight,
    required this.title,
    required this.part,
    required this.type,
  });
  late final int interval;
  late final int set;
  late final int weight;
  late final String title;
  late final String part;
  late final String type;

  factory MyExercises.fromJson(Map<String, dynamic> json) =>
      _$MyExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$MyExercisesToJson(this);
}
