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
class Data {
  Data({
    required this.member,
    required this.study,
  });
  late final Member member;
  late final Study study;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Member {
  Member({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

@JsonSerializable()
class Study extends BaseDto {
  Study({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.round,
    required this.matchingId,
    required this.startedAt,
    required this.endedAt,
    required this.memo,
    required this.myExercises,
    required this.isFinished,
  });
  late final int id;
  late final int round;
  late final int matchingId;
  late final String startedAt;
  late final String endedAt;
  late final String memo;
  late final List<MyExercises> myExercises;
  late final bool isFinished;

  DateTime get startedDate => DateTime.parse(startedAt);
  DateTime get endedDate => DateTime.parse(endedAt);

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}

@JsonSerializable()
class MyExercises {
  MyExercises({
    required this.weight,
    required this.interval,
    required this.set,
    required this.exercise,
  });
  late final int weight;
  late final int interval;
  late final int set;
  late final Exercise exercise;

  factory MyExercises.fromJson(Map<String, dynamic> json) =>
      _$MyExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$MyExercisesToJson(this);
}

@JsonSerializable()
class Exercise {
  Exercise({
    required this.id,
    required this.title,
    required this.part,
    required this.type,
  });
  late final int id;
  late final String title;
  late final String part;
  late final String type;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
