import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar_item.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int selectedDay = int.parse(Utils.getCurrentDateTime('date_number'));

  _handleDayPressed(it) {
    showSimpleDialog(context: context, title: 'event', content: it);
  }

  @override
  Widget build(BuildContext context) {
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
                      highlight: int.parse(it.substring(8)) == selectedDay
                          ? true
                          : false,
                      onTap: () => _handleDayPressed(it),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
