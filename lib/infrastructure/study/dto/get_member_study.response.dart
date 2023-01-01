import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_member_study.response.g.dart';

@JsonSerializable()
class GetStudyResponse extends BaseResponse<Data> {
  GetStudyResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetStudyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStudyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudyResponseToJson(this);
}

@JsonSerializable()

class Data extends BaseDto{
  Data({
    required this.id,
    required this.trainerId,
    required this.memberId,
    required this.memo,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.lastStudyRound,
    required super.createdAt,
    required super.updatedAt,
     super.deletedAt,
    required this.exerciseGoals,
    required this.nextStudyRound,
    required this.availableTicketsCount,
    required this.isExistAvailableTicket,
    required this.isPersonal,
    required this.study,
  });
  late final int id;
  late final int trainerId;
  late final int memberId;
  late final String memo;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int lastStudyRound;
  late final List<ExerciseGoals> exerciseGoals;
  late final int nextStudyRound;
  late final int availableTicketsCount;
  late final bool isExistAvailableTicket;
  late final bool isPersonal;
  late final Study study;
  
   factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

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

@JsonSerializable()
class Study extends BaseDto{
  Study({
    required super.createdAt,
    required super.updatedAt,
     super.deletedAt,
    required this.id,
    required this.matchingId,
    required this.startedAt,
    required this.endedAt,
    required this.memo,
    required this.isDummy,
    required this.myExercises,
    required this.round,
  });
  late final int id;
  late final int matchingId;
  late final DateTime startedAt;
  late final DateTime endedAt;
  late final String memo;
  late final bool isDummy;
  late final List<MyExercises> myExercises;
  late final int round;
  
    factory Study.fromJson(Map<String, dynamic> json) =>
      _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}

@JsonSerializable()
class MyExercises {
  MyExercises({
    required this.weight,
    required this.interval,
    required this.set,
    required this.exerciseId,
    required this.title,
    required this.part,
    required this.type,
  });
  late final int weight;
  late final int interval;
  late final int set;
  late final int exerciseId;
  late final String title;
  late final String part;
  late final String type;
  
    factory MyExercises.fromJson(Map<String, dynamic> json) =>
      _$MyExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$MyExercisesToJson(this);
}