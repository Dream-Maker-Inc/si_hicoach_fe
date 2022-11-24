import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'create_matching_response.g.dart';

@JsonSerializable()
class CreateMatchingResponse extends BaseResponse<Data> {
  CreateMatchingResponse(
      {super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory CreateMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMatchingResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  int id;
  int trainerId;
  int memberId;
  List<Goals> goals;
  String memo;
  int totalTicketCount;
  int totalStudyCount;

  Data(
      {required this.trainerId,
      required this.memberId,
      required this.goals,
      required this.memo,
      required this.totalTicketCount,
      required this.totalStudyCount,
      required super.deletedAt,
      required super.createdAt,
      required super.updatedAt,
      required this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Goals extends BaseDto {
  int id;
  String title;

  Goals({
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
    required this.id,
    required this.title,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}
