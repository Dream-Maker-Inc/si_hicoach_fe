import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  dynamic ref;
  Data? data;
  String statusCode;
  String message;

  SignUpResponse(this.ref, this.data, this.statusCode, this.message);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

@JsonSerializable()
class Data {
  Member member;
  List<AgreedTerms> agreedTerms;

  Data(this.member, this.agreedTerms);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Member {
  int id;
  String email;
  String name;
  String gender;
  String birthDay;
  String phone;
  Password password;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  TrainerInfo? trainerInfo;

  Member(
    this.email,
    this.name,
    this.gender,
    this.birthDay,
    this.phone,
    this.password,
    this.trainerInfo,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.deletedAt,
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

@JsonSerializable()
class Password {
  Password(this.value);

  String value;

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);
}

@JsonSerializable()
class TrainerInfo {
  TrainerInfo(this.companyName);

  String companyName;

  factory TrainerInfo.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerInfoToJson(this);
}

@JsonSerializable()
class AgreedTerms {
  int memberId;
  int serviceTermId;
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  AgreedTerms(this.memberId, this.serviceTermId, this.id, this.createdAt,
      this.updatedAt, this.deletedAt);

  factory AgreedTerms.fromJson(Map<String, dynamic> json) =>
      _$AgreedTermsFromJson(json);

  Map<String, dynamic> toJson() => _$AgreedTermsToJson(this);
}
