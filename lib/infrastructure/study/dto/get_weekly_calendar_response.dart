import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_weekly_calendar_response.g.dart';

@JsonSerializable()
class GetWeeklyCalendarResponse extends BaseResponse<Data> {
  GetWeeklyCalendarResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetWeeklyCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeeklyCalendarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeeklyCalendarResponseToJson(this);
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
    required this.week,
    required this.studies,
  });
  late final int week;
  late final List<Studies> studies;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Studies {
  Studies({
    required this.study,
    required this.member,
    required this.weekDay,
    this.holiday,
  });
  late final Study study;
  late final Member member;
  late final int weekDay;
  late final Holiday? holiday;

  factory Studies.fromJson(Map<String, dynamic> json) =>
      _$StudiesFromJson(json);

  Map<String, dynamic> toJson() => _$StudiesToJson(this);
}

@JsonSerializable()
class Study {
  Study({
    required this.id,
    required this.matchingId,
    required this.round,
    required this.startedAt,
    required this.endedAt,
    required this.myExercises,
    required this.memo,
    required this.isFinished,
  });
  late final int id;
  late final int matchingId;
  late final int round;
  late final DateTime startedAt;
  late final DateTime endedAt;
  late final List<MyExercises> myExercises;
  late final String memo;
  late final bool isFinished;

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}

@JsonSerializable()
class MyExercises {
  MyExercises({
    required this.interval,
    required this.set,
    required this.weight,
    required this.exercise,
  });
  late final int interval;
  late final int set;
  late final int weight;
  late final Exercise exercise;

  factory MyExercises.fromJson(Map<String, dynamic> json) =>
      _$MyExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$MyExercisesToJson(this);
}

@JsonSerializable()
class Exercise extends BaseDto {
  Exercise({
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

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
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
class Holiday {
  Holiday({
    required this.date,
    required this.title,
  });
  late final String date;
  late final String title;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayToJson(this);
}
