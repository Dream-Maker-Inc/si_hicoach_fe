import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar_item.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/left_shadow.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/right_shadow.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int selectedDay = int.parse(Utils.getCurrentDateTime('date_number'));

  @override
  Widget build(BuildContext context) {
    List<int> daysOfThisMonthList = [];

    for (int i = 1; i <= Utils.getLastDayOfThisMonth(); i++) {
      daysOfThisMonthList.add(i);
    }

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: <Widget>[
            Wrap(
              children: daysOfThisMonthList.map(
                (it) {
                  while (true) {
                    for (int i = 0; i <= Utils.koreanDate.length; i++) {
                      if (it == selectedDay) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: CalendarItem(
                            dayText: Utils.getDayTextFromDayNumber(it),
                            dayNumber: it,
                            highlight: true,
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: CalendarItem(
                            dayText: Utils.getDayTextFromDayNumber(it),
                            dayNumber: it,
                            highlight: false,
                          ),
                        );
                      }
                    }
                  }
                },
              ).toList(),
            ),
          ]),
        ),
        const LeftShadow(),
        const RightShadow(),
      ],
    );
  }
}
