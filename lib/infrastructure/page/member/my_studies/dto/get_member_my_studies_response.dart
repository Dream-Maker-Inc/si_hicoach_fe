import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_member_my_studies_response.g.dart';

@JsonSerializable()
class GetMemberMyStudiesResponse extends BaseResponse<List<Data>> {
  GetMemberMyStudiesResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMemberMyStudiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberMyStudiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberMyStudiesResponseToJson(this);
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
    required this.studies,
  });
  late final int id;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int nextStudyRound;
  late final bool isPersonal;
  late final int availableTicketsCount;
  late final List<Studies> studies;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Studies {
  Studies({
    required this.id,
    required this.round,
    required this.startedAt,
    required this.endedAt,
  });
  late final int id;
  late final int matchingId;
  late final int round;
  late final DateTime startedAt;
  late final DateTime endedAt;

  factory Studies.fromJson(Map<String, dynamic> json) =>
      _$StudiesFromJson(json);

  Map<String, dynamic> toJson() => _$StudiesToJson(this);
}
