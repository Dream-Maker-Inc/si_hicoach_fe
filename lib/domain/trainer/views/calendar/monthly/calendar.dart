import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/calendar/monthly/header.dart';
import 'package:si_hicoach_fe/domain/trainer/views/calendar/monthly/item.dart';

class TrainerMonthlyCalendar extends StatelessWidget {
  const TrainerMonthlyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: Utils.getCurrentDateTime('year_month'),
      ),
      body: Column(
        children: <Widget>[
          CalendarHeader(),
          Table(
            border: TableBorder.all(color: Colors.black12),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              5,
              (index) => const TableRow(
                children: <Widget>[
                  MonthlyCalendarItem(date: 1, name: '오르다'),
                  MonthlyCalendarItem(date: 2, name: '오르다'),
                  MonthlyCalendarItem(date: 3),
                  MonthlyCalendarItem(date: 4, name: '오르다'),
                  MonthlyCalendarItem(date: 5),
                  MonthlyCalendarItem(date: 6),
                  MonthlyCalendarItem(date: 7, name: '오르다'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
