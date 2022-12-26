import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/base_item.dart';

// 개인 일정 표시 아이템
class HolidayItemView extends StatelessWidget {
  final String holidayTitle;

  const HolidayItemView({
    super.key,
    this.holidayTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: holidayTitle,
      child: BaseMonthlyCalendarItem(
        itemBackground: BoxDecoration(
          color: Colors.redAccent.shade100,
          borderRadius: BorderRadius.circular(4),
        ),
        text: "1",
        icon: const Icon(
          Icons.home,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
