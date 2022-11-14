import 'package:json_annotation/json_annotation.dart';

part 'get_member_response.g.dart';

@JsonSerializable()
class GetMemberResponse {
  GetMemberResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  late final dynamic ref;
  late final Data data;
  late final String statusCode;
  late final String message;

  factory GetMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMemberResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.member,
  });

  late final Member member;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Member {
  Member({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
  });

  late final String createdAt;
  late final String updatedAt;
  late final int id;
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
  late final String? deletedAt;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
