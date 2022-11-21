import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_dto.dart';
part 'get_terms_response.g.dart';

@JsonSerializable()
class GetTermsResponse {
  dynamic ref;
  List<Data>? data;
  String statusCode;
  String message;

  GetTermsResponse(this.ref, this.data, this.statusCode, this.message);

  factory GetTermsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTermsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTermsResponseToJson(this);
}

@JsonSerializable()
class Data extends BaseDto {
  int id;
  String title;
  String content;
  bool isRequired;
  MyAgreed? myAgreed;

  Data(
      {required super.createdAt,
      required super.updatedAt,
      required super.deletedAt,
      required this.id,
      required this.title,
      required this.content,
      required this.isRequired,
      this.myAgreed});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class MyAgreed extends BaseDto {
  int id;
  int memberId;
  int serviceTermId;

  MyAgreed(
      {required this.id,
      required this.memberId,
      required this.serviceTermId,
      required super.createdAt,
      required super.updatedAt,
      super.deletedAt});

  factory MyAgreed.fromJson(Map<String, dynamic> json) =>
      _$MyAgreedFromJson(json);
  Map<String, dynamic> toJson() => _$MyAgreedToJson(this);
}
