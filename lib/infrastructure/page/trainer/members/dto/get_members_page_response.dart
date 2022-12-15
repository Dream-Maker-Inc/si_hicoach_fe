import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_members_page_response.g.dart';

@JsonSerializable()
class GetMembersPageResponse extends BaseResponse<Data> {
  GetMembersPageResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMembersPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMembersPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMembersPageResponseToJson(this);
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
    required this.member,
    required this.matching,
    required this.totalStudyCount,
    this.latestStudy,
  });

  late final Member member;
  late final Matching matching;
  final LatestStudy? latestStudy;
  late final int totalStudyCount;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
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
    required this.createdAt,
    required this.ticketCount,
  });

  late final int id;
  late final DateTime createdAt;
  late final int ticketCount;

  get createdAtLabel => createdAt.toKoreanFormat;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
}

@JsonSerializable()
class LatestStudy {
  LatestStudy({
    required this.id,
    required this.round,
    required this.isFinished,
  });

  late final int id;
  late final int round;
  late final bool isFinished;

  factory LatestStudy.fromJson(Map<String, dynamic> json) =>
      _$LatestStudyFromJson(json);

  Map<String, dynamic> toJson() => _$LatestStudyToJson(this);
}
