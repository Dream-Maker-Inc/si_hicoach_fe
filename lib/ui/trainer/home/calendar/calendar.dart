// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/ui/trainer/home/calendar/calendar_item.dart';
import 'package:si_hicoach_fe/ui/trainer/home/main_vm.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final TrainerMainViewModel _vm = Get.find<TrainerMainViewModel>();

  _handleDayPressed(DateTime date) {
    _vm.targetDate.value = date;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dates = _vm.getMainDates();

      return Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dates.map((it) => _CalendarItem(it)).toList(),
            ),
          ),
        ],
      );
    });
  }

  Widget _CalendarItem(DateTime date) {
    final targetDate = _vm.targetDate.value;

    return SizedBox(
      width: (MediaQuery.of(context).size.width / 7) - 2,
      child: CalendarItem(
        dayText: date.weekdayLabel,
        dayNumber: date.day,
        highlight: date.isEqualDate(targetDate),
        onTap: () => _handleDayPressed(date),
      ),
    );
  }
}
