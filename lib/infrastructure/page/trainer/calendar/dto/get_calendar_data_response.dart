import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_calendar_data_response.g.dart';

@JsonSerializable()
class GetCalendarDataResponse extends BaseResponse<Data> {
  GetCalendarDataResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetCalendarDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCalendarDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCalendarDataResponseToJson(this);
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
    required this.study,
    required this.matching,
    required this.member,
  });
  late final Study study;
  late final Matching matching;
  late final Member member;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Study {
  Study({
    required this.id,
    required this.round,
    required this.memo,
    required this.startedAt,
    required this.endedAt,
  });
  late final int id;
  late final int round;
  late final String memo;
  late final DateTime startedAt;
  late final DateTime endedAt;

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}

@JsonSerializable()
class Matching {
  Matching({
    required this.id,
  });
  late final int id;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
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
