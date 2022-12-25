import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar_common.dart';

class CalendarItemWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClick;

  const CalendarItemWrapper({
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
          height: calendarItemHeight,
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
        ),
      ),
    );
  }
}
