import 'package:json_annotation/json_annotation.dart';
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
class Data {
  int id;
  String title;
  String content;
  bool isRequired;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  MyAgreed myAgreed;

  Data(this.createdAt, this.updatedAt, this.deletedAt, this.id, this.title,
      this.content, this.isRequired, this.myAgreed);

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class MyAgreed {
  int id;
  int memberId;
  int serviceTermId;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  MyAgreed(this.id, this.memberId, this.serviceTermId, this.createdAt,
      this.updatedAt, this.deletedAt);

  factory MyAgreed.fromJson(Map<String, dynamic> json) =>
      _$MyAgreedFromJson(json);
  Map<String, dynamic> toJson() => _$MyAgreedToJson(this);
}