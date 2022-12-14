import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_matching_response.g.dart';

@JsonSerializable()
class GetMatchingResponse extends BaseResponse<Data> {
  GetMatchingResponse(
      {super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMatchingResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  Data({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.trainerId,
    required this.memberId,
    required this.memo,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.lastStudyRound,
    required this.exerciseGoals,
  });
  late final int id;
  late final int trainerId;
  late final int memberId;
  late final String memo;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int lastStudyRound;
  late final List<ExerciseGoals> exerciseGoals;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ExerciseGoals extends BaseDto {
  ExerciseGoals({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.title,
  });

  late final int id;
  late final String title;

  factory ExerciseGoals.fromJson(Map<String, dynamic> json) =>
      _$ExerciseGoalsFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseGoalsToJson(this);
}
