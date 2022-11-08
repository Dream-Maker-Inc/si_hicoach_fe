import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class WeeklyCalendarHeader extends StatelessWidget {
  WeeklyCalendarHeader({super.key});

  final List<String> dayList = ['', '일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    Widget tableHeaderDays(text) {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 7,
        height: 26,
        child: Center(
          child: Text(
            text,
            style: bodySmall.copyWith(
              color: Colors.grey.shade500,
            ),
          ),
        ),
      );
    }

    return Table(
      border: TableBorder.all(color: Colors.black12),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(24),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: List.of(
            dayList.map((it) => tableHeaderDays(it)),
          ),
        ),
      ],
    );
  }
}
