import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_member_my_page_response.g.dart';

@JsonSerializable()
class GetMemberMyPageResponse extends BaseResponse<Data> {
  GetMemberMyPageResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMemberMyPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberMyPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberMyPageResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.member,
    this.matching,
  });
  late final Member member;
  late final Matching? matching;

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
class Matching {
  Matching({
    required this.id,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.lastStudyRound,
    required this.nextStudyRound,
    required this.isPersonal,
    required this.availableTicketsCount,
    required this.trainer,
  });
  late final int id;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int lastStudyRound;
  late final int nextStudyRound;
  late final bool isPersonal;
  late final int availableTicketsCount;
  late final Trainer trainer;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
}

@JsonSerializable()
class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.companyName,
  });
  late final int id;
  late final String name;
  late final String companyName;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerToJson(this);
}
