import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/calendar/weekly/components/header.dart';
import 'package:si_hicoach_fe/domain/common/calendar/weekly/components/item.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  final List<String> dayList = ['', '일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    TextStyle timeTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black45,
    );

    return Column(
      children: <Widget>[
        WeeklyCalendarHeader(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Table(
                  border: TableBorder.all(color: Colors.black12),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(24)
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: List.generate(
                    24,
                    (index) => TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              index.toString(),
                              style: timeTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        const WeeklyCalendarItem(name: '홍길동'),
                        const WeeklyCalendarItem(name: '홍길동'),
                        const WeeklyCalendarItem(),
                        const WeeklyCalendarItem(name: '홍길동'),
                        const WeeklyCalendarItem(),
                        const WeeklyCalendarItem(),
                        const WeeklyCalendarItem(name: '홍길동'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
