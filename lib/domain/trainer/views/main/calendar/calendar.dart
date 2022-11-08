import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar_item.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int selectedDay = int.parse(Utils.getCurrentDateTime('date_number'));

  Widget leftShadow() {
    return Container(
      width: 100,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(255, 255, 255, 0),
          ],
        ),
      ),
    );
  }

  Widget rightShadow() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 100,
        height: 80,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0),
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }

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
              children: daysOfThisMonthList.map((day) {
                while (true) {
                  for (int i = 0; i <= Utils.koreanDate.length; i++) {
                    if (day == selectedDay) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        child: CalendarItem(
                          dayText: Utils.getDayTextFromDayNumber(day),
                          dayNumber: day,
                          highlight: true,
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        child: CalendarItem(
                          dayText: Utils.getDayTextFromDayNumber(day),
                          dayNumber: day,
                          highlight: false,
                        ),
                      );
                    }
                  }
                }
              }).toList(),
            ),
          ]),
        ),
        leftShadow(),
        rightShadow(),
      ],
    );
  }
}
