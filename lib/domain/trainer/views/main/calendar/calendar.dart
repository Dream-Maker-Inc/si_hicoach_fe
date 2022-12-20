import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar_item.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/main_vm.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final MainViewModel _vm = Get.find<MainViewModel>();

  _handleDayPressed(String it) {
    _vm.targetDate.value = DateTime.parse(it);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int targetDay = _vm.targetDate.value.day;

      return Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Utils.getThisWeekDays()
                  .map(
                    (it) => SizedBox(
                      width: MediaQuery.of(context).size.width / 7 - 2,
                      child: CalendarItem(
                        dayText: Utils.getDayTextFromDayNumber(
                          int.parse(it.substring(8)),
                        ),
                        dayNumber: int.parse(it.substring(8)),
                        highlight: int.parse(it.substring(8)) == targetDay
                            ? true
                            : false,
                        // onTap: () => _handleDayPressed(it),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}
