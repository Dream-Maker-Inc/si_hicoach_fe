// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/calendar/common/calendar_common.dart';

final List<String> _DAY_LIST = ['일', '월', '화', '수', '목', '금', '토'];

class MonthlyCalendarHeader extends StatelessWidget {
  const MonthlyCalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_WeekItems()],
    );
  }

  // 요일 아이템들
  Widget _WeekItems() {
    return Expanded(
      child: Row(
        children: _DAY_LIST
            .map(
              (dayName) => _WeekItem(dayName),
            )
            .toList(),
      ),
    );
  }

  // 요일 아이템
  Widget _WeekItem(String text) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: calendarBorder,
          right: calendarBorder,
          bottom: calendarBorder,
        ),
      ),
      alignment: Alignment.center,
      height: calendarHeaderHeight,
      child: Text(
        text,
        style: bodySmall.copyWith(
          color: Colors.grey.shade500,
        ),
      ),
    ));
  }
}
