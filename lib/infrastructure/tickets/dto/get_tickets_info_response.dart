import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_tickets_info_response.g.dart';

@JsonSerializable()
class GetTicketsInfoResponse extends BaseResponse<Data> {
  GetTicketsInfoResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetTicketsInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTicketsInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTicketsInfoResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.finishedStudyCount,
    required this.remainingTicketCount,
  });

  late final int finishedStudyCount;
  late final int remainingTicketCount;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
