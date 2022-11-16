import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_matching_response.g.dart';

@JsonSerializable()
class GetMatchingResponse extends BaseResponse<Data> {
  GetMatchingResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMatchingResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  Data({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.trainerId,
    required this.memberId,
    required this.memo,
    required this.ticketCount,
    required this.goals,
  });

  late final int id;
  late final int trainerId;
  late final int memberId;
  late final String memo;
  late final int ticketCount;
  late final List<Goals> goals;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
