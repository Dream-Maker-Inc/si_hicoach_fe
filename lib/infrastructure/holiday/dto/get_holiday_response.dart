import 'package:json_annotation/json_annotation.dart';
import 'package:si_hicoach_fe/infrastructure/common/base_response.dart';

part 'get_holiday_response.g.dart';

@JsonSerializable()
class GetHolidayResponse extends BaseResponse<List<Data>> {
  GetHolidayResponse(
      {required super.ref,
      required super.data,
      required super.statusCode,
      required super.message});

  factory GetHolidayResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHolidayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHolidayResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.date,
    required this.title,
    required this.isSubstitueHoliday,
  });
  late final DateTime date;
  late final String title;
  late final bool isSubstitueHoliday;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
