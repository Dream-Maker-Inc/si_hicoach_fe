import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';

part 'recover_matching_response.g.dart';

@JsonSerializable()
class RecoverMatchingResponse {
  dynamic ref;
  Data? data;
  String statusCode;
  String message;

  RecoverMatchingResponse(this.ref, this.data, this.statusCode, this.message);

  factory RecoverMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$RecoverMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecoverMatchingResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  int id;
  int trainerId;
  int memberId;
  String memo;
  int ticketCount;
  List<Goals> goals;

  Data(
      {required this.id,
      required this.trainerId,
      required this.memberId,
      required this.memo,
      required this.ticketCount,
      required this.goals,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Goals extends BaseDto {
  int id;
  String title;

  Goals(
      {required this.id,
      required this.title,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt});

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}
