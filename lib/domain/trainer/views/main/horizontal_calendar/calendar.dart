import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/horizontal_calendar/calendar_item.dart';

class TrainerMainCalendar extends StatelessWidget {
  const TrainerMainCalendar({Key? key}) : super(key: key);

  Widget leftShadow() {
    return Container(
      width: 100,
      height: 100,
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
        height: 100,
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
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const <Widget>[
              TrainerMainCalendarItem(day: '월', date: '31'),
              TrainerMainCalendarItem(day: '화', date: '1'),
              TrainerMainCalendarItem(day: '수', date: '2'),
              TrainerMainCalendarItem(day: '목', date: '3'),
              TrainerMainCalendarItem(day: '금', date: '4'),
              TrainerMainCalendarItem(day: '토', date: '5'),
              TrainerMainCalendarItem(day: '일', date: '6'),
              TrainerMainCalendarItem(day: '월', date: '7'),
              TrainerMainCalendarItem(day: '화', date: '8'),
              TrainerMainCalendarItem(day: '수', date: '9'),
              TrainerMainCalendarItem(day: '목', date: '10'),
              TrainerMainCalendarItem(day: '금', date: '11'),
              TrainerMainCalendarItem(day: '토', date: '12'),
              TrainerMainCalendarItem(day: '일', date: '13'),
            ],
          ),
        ),
        leftShadow(),
        rightShadow(),
      ],
    );
  }
}
