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
    required this.member,
    required this.matching,
    required this.latestStudy,
  });

  late final Member member;
  late final Matching matching;
  late final LatestStudy? latestStudy;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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

@JsonSerializable()
class Matching {
  Matching({
    required this.id,
    required this.ticketCount,
    required this.goals,
    required this.memo,
  });

  late final int id;
  late final int ticketCount;
  late final List<Goals> goals;
  late final String memo;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
}

@JsonSerializable()
class Goals extends BaseDto {
  Goals({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.title,
  });

  late final int id;
  late final String title;

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}

@JsonSerializable()
class LatestStudy {
  LatestStudy({
    required this.id,
    required this.startedAt,
    required this.totalStudyCount,
  });

  late final int id;
  late final String startedAt;
  late final int totalStudyCount;

  factory LatestStudy.fromJson(Map<String, dynamic> json) =>
      _$LatestStudyFromJson(json);

  Map<String, dynamic> toJson() => _$LatestStudyToJson(this);
}
