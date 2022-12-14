import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_member_page_response.g.dart';

@JsonSerializable()
class GetMemberPageResponse extends BaseResponse<Data> {
  GetMemberPageResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMemberPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberPageResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.id,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.completedStudyCount,
    required this.nextStudyRound,
    required this.isPersonal,
    required this.availableTicketsCount,
    required this.memo,
    required this.createdAt,
    required this.exerciseGoals,
    required this.member,
  });
  late final int id;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int completedStudyCount;
  late final int nextStudyRound;
  late final bool isPersonal;
  late final int availableTicketsCount;
  late final String memo;
  late final DateTime createdAt;
  late final List<ExerciseGoals> exerciseGoals;
  late final Member member;

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

@JsonSerializable()
class Member {
  Member({
    required this.id,
    required this.name,
    required this.birthDay,
    required this.gender,
  });
  late final int id;
  late final String name;
  late final String birthDay;
  late final String gender;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
