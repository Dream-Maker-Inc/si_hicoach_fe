import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_monthly_calendar_response.g.dart';

@JsonSerializable()
class GetMonthlyCalendarResponse extends BaseResponse<List<Data>> {
  GetMonthlyCalendarResponse({
    super.ref,
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory GetMonthlyCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMonthlyCalendarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMonthlyCalendarResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.date,
    required this.personalStudyCount,
    required this.memberStudyCount,
  });
  late final DateTime date;
  late final int personalStudyCount;
  late final int memberStudyCount;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
