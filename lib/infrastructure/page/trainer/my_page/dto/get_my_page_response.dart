import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_my_page_response.g.dart';

@JsonSerializable()
class GetMyPageResponse extends BaseResponse<Data> {
  GetMyPageResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMyPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyPageResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.trainer,
    required this.finishedStudiesCount,
  });

  late final Trainer trainer;
  late final FinishedStudiesCount finishedStudiesCount;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.trainerInfo,
  });

  late final int id;
  late final String name;
  late final TrainerInfo trainerInfo;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerToJson(this);
}

@JsonSerializable()
class TrainerInfo {
  TrainerInfo({
    required this.companyName,
  });

  late final String companyName;

  factory TrainerInfo.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerInfoToJson(this);
}

@JsonSerializable()
class FinishedStudiesCount {
  FinishedStudiesCount({
    required this.lastMonth,
    required this.thisMonthAtUntilToday,
  });

  late final int lastMonth;
  late final int thisMonthAtUntilToday;

  factory FinishedStudiesCount.fromJson(Map<String, dynamic> json) =>
      _$FinishedStudiesCountFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedStudiesCountToJson(this);
}
