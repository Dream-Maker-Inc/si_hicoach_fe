import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class MonthlyCalendarHeader extends StatelessWidget {
  MonthlyCalendarHeader({super.key});

  final List<String> dayList = ['일', '월', '화', '수', '목', '금', '토'];

  TableBorder tableBorder = TableBorder.all(
    width: 1,
    color: Colors.black12,
    style: BorderStyle.solid,
  );

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
      border: tableBorder,
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
