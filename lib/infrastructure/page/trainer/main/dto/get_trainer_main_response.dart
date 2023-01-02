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
    required this.id,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.nextStudyRound,
    required this.isPersonal,
    required this.availableTicketsCount,
    required this.member,
    required this.study,
  });
  late final int id;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int nextStudyRound;
  late final bool isPersonal;
  late final int availableTicketsCount;
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
class Study {
  Study({
    required this.id,
    required this.round,
    required this.startedAt,
    required this.endedAt,
  });
  late final int id;
  late final int round;
  late final DateTime startedAt;
  late final DateTime endedAt;

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  Map<String, dynamic> toJson() => _$StudyToJson(this);
}
