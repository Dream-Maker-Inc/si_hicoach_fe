import 'package:json_annotation/json_annotation.dart';
part 'get_member_of_trainer_response.g.dart';

@JsonSerializable()
class GetMemberOfTrainerResponse {
  GetMemberOfTrainerResponse(
    this.ref,
    this.data,
    this.statusCode,
    this.message,
  );

  dynamic ref;
  Data? data;
  String statusCode;
  String message;

  factory GetMemberOfTrainerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberOfTrainerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberOfTrainerResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data(this.member, this.matching);

  Member member;
  Matching? matching;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Member {
  Member(this.id, this.email, this.name);

  int id;
  String email;
  String name;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

@JsonSerializable()
class Matching {
  Matching(this.id, this.isPast);

  int id;
  bool isPast;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingToJson(this);
}
