import 'package:json_annotation/json_annotation.dart';

part 'get_trainer_main_response.g.dart';

@JsonSerializable()
class GetTrainerMainResponse {
  dynamic ref;
  List<Data> data;
  String statusCode;
  String message;

  GetTrainerMainResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory GetTrainerMainResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTrainerMainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTrainerMainResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.member,
    required this.matching,
    required this.study,
    required this.totalStudyCount,
  });
  late final Member member;
  late final Matching matching;
  late final Study study;
  late final int totalStudyCount;

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
    required this.createdAt,
    required this.ticketCount,
    required this.isPersonal,
  });
  late final int id;
  late final DateTime createdAt;
  late final int ticketCount;
  late final bool isPersonal;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
}

@JsonSerializable()
class Study {
  Study({
    required this.id,
    required this.round,
    required this.startedAt,
    required this.endedAt,
    required this.isFinished,
  });
  late final int id;
  late final int round;
  late final DateTime startedAt;
  late final DateTime endedAt;
  late final bool isFinished;

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}
