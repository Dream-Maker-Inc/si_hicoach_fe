import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/header.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/item.dart';

class MonthlyCalendarView extends StatelessWidget {
  const MonthlyCalendarView({
    super.key,
    this.isBackButtonEnabled = false,
  });

  final bool isBackButtonEnabled;

  @override
  Widget build(BuildContext context) {
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

    PreferredSizeWidget appbar = isBackButtonEnabled
        ? CustomAppBarArrowBack(
            titleText: Utils.getCurrentDateTime('year_month'),
          ) as PreferredSizeWidget
        : CustomAppBarWithLogo(
            titleText: Utils.getCurrentDateTime('year_month'),
          );

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: <Widget>[
          MonthlyCalendarHeader(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Table(
                    border: tableBorder,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
