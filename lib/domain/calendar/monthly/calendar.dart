import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/utils/calendar.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/header.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/item.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/monthly_calendar_vm.dart';
import 'package:si_hicoach_fe/domain/study/detail/detail.dart';

const weekDays = [7, 1, 2, 3, 4, 5, 6];

class MonthlyCalendarView extends StatefulWidget {
  const MonthlyCalendarView({
    super.key,
    this.isBackButtonEnabled = false,
  });

  final bool isBackButtonEnabled;

  @override
  State<MonthlyCalendarView> createState() => _MonthlyCalendarViewState();
}

class _MonthlyCalendarViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

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

    PreferredSizeWidget appbar = widget.isBackButtonEnabled
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
                  child: _buildTable(tableBorder),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTable(TableBorder tableBorder) {
    const maxCalendarShowCount = 35;

    useIncreaseIndex() {
      int index = 0;

      increaseIndex() => index++;

      return increaseIndex;
    }

    Color getDayTextColor(DateTime date, bool isHoliday) {
      const saturday = 6;
      const sunday = 7;

      if (!date.isThisMonth) {
        return Colors.grey.shade400;
      }

      if (isHoliday) {
        return Colors.redAccent.shade200;
      }

      if (date.weekday == saturday) {
        return Colors.blueAccent.shade700;
      }

      if (date.weekday == sunday) {
        return Colors.redAccent.shade700;
      }

      return Colors.blueGrey.shade800;
    }

    return Obx(() {
      final weeks = vm.weeks;
      final calendarVisibleDate = getCalendarVisibleDate(maxCalendarShowCount);

      final getIndex = useIncreaseIndex();

      TableRow buildTableRow(int week) {
        final studies = vm.getStudyItemModelsByWeek(week);
        final personalStudies = vm.getPersonalStudyItemModelsByWeek((week));

        final items = weekDays.map((weekDay) {
          final targetDayStudyItems =
              studies.where((it) => it.weekDay == weekDay).toList();

          final targetDayPersonalStudyItems =
              personalStudies.where((it) => it.weekDay == weekDay).toList();

          final targetDate = calendarVisibleDate[getIndex()];

          final holiday = vm.getHolidayOrNull(targetDate);
          final isHoliday = (holiday != null);

          return MonthlyCalendarItem(
            dayTextColor: getDayTextColor(targetDate, isHoliday),
            date: targetDate.day,
            holidayText: isHoliday ? holiday.title : null,
            studyCount:
                targetDayStudyItems.isNotEmpty ? targetDayStudyItems.length : 0,
            personalStudyCount: targetDayPersonalStudyItems.isNotEmpty
                ? targetDayPersonalStudyItems.length
                : 0,
          );
        }).toList();

        return TableRow(children: items);
      }

      return Table(
        border: tableBorder,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: List.generate(
          weeks,
          (index) => buildTableRow(index + 1),
        ),
      );
    });
  }
}

class _Detail
    extends MyGetXState<MonthlyCalendarView, MonthlyCalendarViewModel> {
  handleWeeklyCalendarItemClick(int studyId) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                StudyDetailView(studyId: studyId, isMemberDetailEnabled: false),
          ),
        )
        .then((_) => vm.fetchMemberStudies());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      Get.defaultDialog(title: 'Error', content: Text(e.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMemberStudies()]);
    });
    return widget;
  }

  @override
  MonthlyCalendarViewModel createViewModel() => MonthlyCalendarViewModel();
}
