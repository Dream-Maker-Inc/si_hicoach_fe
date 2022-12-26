// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/calendar/common/calendar_common.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/monthly_calendar_vm.dart';

const SATUR_DAY = 6;
const SUN_DAY = 7;

class MonthlyCalendarItemWrapper extends StatelessWidget {
  final DateTime itemDate;
  final Widget child;
  final VoidCallback? onClick;

  MonthlyCalendarItemWrapper({
    super.key,
    required this.itemDate,
    required this.child,
    this.onClick,
  });

  final vm = Get.find<MonthlyCalendarViewModel>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              right: calendarBorder,
              bottom: calendarBorder,
            ),
          ),
          height: getMonthlyCalendarItemHeight(context),
          child: Column(
            children: [
              _Day(),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _Day() {
    return Obx(() {
      return Text(
        itemDate.day.toString(),
        style: bodySmall.copyWith(
          color: _getDayTextColor(),
        ),
      );
    });
  }

  Color _getDayTextColor() {
    // 기준 날짜
    final baseDate = vm.targetDate;
    final isHoliday = vm.isHoliday(itemDate);

    if (!itemDate.isIncludeYearMonth(baseDate.year, baseDate.month)) {
      return Colors.grey.shade400;
    }

    if (isHoliday) {
      return Colors.redAccent.shade200;
    }

    if (itemDate.weekday == SATUR_DAY) {
      return Colors.blueAccent.shade700;
    }

    if (itemDate.weekday == SUN_DAY) {
      return Colors.redAccent.shade700;
    }

    return Colors.blueGrey.shade800;
  }
}
