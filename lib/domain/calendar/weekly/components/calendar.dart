import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/header.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/item.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class WeeklyCalendar extends StatelessWidget {
  WeeklyCalendar({super.key});

  TableBorder tableBorder = const TableBorder(
    horizontalInside: BorderSide(
      width: 1,
      color: Colors.black12,
      style: BorderStyle.solid,
    ),
    verticalInside: BorderSide(
      width: 1,
      color: Colors.black12,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeeklyCalendarHeader(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Table(
                  border: tableBorder,
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
                              style: bodySmall.copyWith(
                                color: Colors.grey.shade500,
                              ),
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
