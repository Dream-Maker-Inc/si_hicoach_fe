import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';
import 'package:si_hicoach_fe/infrastructure/common/meta_data_response.dart';

part 'get_members_page_response.g.dart';

@JsonSerializable()
class GetMembersPageResponse extends BaseResponse<Data> {
  GetMembersPageResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMembersPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMembersPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMembersPageResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.metaData,
    required this.items,
  });

  late final MetaData metaData;
  late final List<Items> items;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    required this.id,
    required this.totalTicketCount,
    required this.totalStudyCount,
    required this.nextStudyRound,
    required this.isPersonal,
    required this.availableTicketsCount,
    required this.createdAt,
    required this.member,
  });
  late final int id;
  late final int totalTicketCount;
  late final int totalStudyCount;
  late final int nextStudyRound;
  late final bool isPersonal;
  late final int availableTicketsCount;
  late final DateTime createdAt;
  late final Member member;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Member {
  Member({
    required this.id,
    required this.name,
    required this.isRoleTrainer,
  });
  late final int id;
  late final String name;
  late final bool isRoleTrainer;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
