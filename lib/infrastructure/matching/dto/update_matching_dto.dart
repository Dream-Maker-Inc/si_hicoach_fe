import 'package:get/get.dart';

class UpdateMatchingDto {
  List<String> goals;
  String? memo;
  int? ticketCount;

  UpdateMatchingDto({
    required this.goals,
    this.memo,
    this.ticketCount,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {'goals': goals};

    map.addIf(memo != null, "memo", memo);
    map.addIf(ticketCount != null, 'ticketCount', ticketCount);

    return map;
  }
}
