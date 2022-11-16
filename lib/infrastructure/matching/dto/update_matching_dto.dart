import 'package:get/get.dart';

class UpdateMatchingDto {
  List<String>? goals;
  String? memo;
  int? ticketCount;

  UpdateMatchingDto({
    this.goals,
    this.memo,
    this.ticketCount,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map.addIf(goals != null, "goals", goals);
    map.addIf(memo != null, "memo", memo);
    map.addIf(ticketCount != null, 'ticketCount', ticketCount);

    return map;
  }
}
