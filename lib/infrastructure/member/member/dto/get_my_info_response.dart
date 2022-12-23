import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_my_info_response.g.dart';

@JsonSerializable()
class GetMyInfoResponse extends BaseResponse<Data> {
  GetMyInfoResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMyInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyInfoResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.member,
    this.matching,
    this.trainer,
  });

  late final Member member;
  late final Matching? matching;
  late final Trainer? trainer;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Member extends BaseDto {
  Member({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
    this.trainerInfo,
  });

  late final int id;
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
  late final TrainerInfo? trainerInfo;

  bool get isRoleTrainer => (trainerInfo != null);

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
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
class Trainer extends BaseDto {
  Trainer({
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
    required this.trainerInfo,
  });

  late final int id;
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
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

  late final String? companyName;

  factory TrainerInfo.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerInfoToJson(this);
}
