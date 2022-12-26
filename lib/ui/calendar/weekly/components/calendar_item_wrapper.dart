import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/ui/calendar/common/calendar_common.dart';

class WeeklyCalendarItemWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClick;

  const WeeklyCalendarItemWrapper({
    super.key,
    required this.child,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: calendarBorder,
              bottom: calendarBorder,
            ),
          ),
          height: weeklyCalendarItemHeight,
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
        ),
      ),
    );
  }
}
