import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/header.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/item.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/weekly_calendar_vm.dart';
import 'package:si_hicoach_fe/domain/study/detail/detail.dart';

const dayTimeCount = 24;
const weekDays = [7, 1, 2, 3, 4, 5, 6];

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  WeeklyCalendarViewModel vm = Get.find<WeeklyCalendarViewModel>();

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
                child: _buildTable(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildTable() {
    return Obx(() => Table(
          border: tableBorder,
          columnWidths: const <int, TableColumnWidth>{0: FixedColumnWidth(24)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: _buildWeeklyCalendarItems(),
        ));
  }

  _buildWeeklyCalendarItems() {
    final weekStudyItems = vm.weekStudyItems;

    buildWeekDays(int time) => weekDays.map((weekDay) {
          final weekStudyItem = weekStudyItems.firstWhereOrNull(
              (it) => (it.startedTime == time) && (it.weekDay == weekDay));

          if (weekStudyItem == null) return const WeeklyCalendarItem();

          return WeeklyCalendarItem(
            props: WeeklyCalendarItemProps(
                name: weekStudyItem.title,
                onClick: () =>
                    handleWeeklyCalendarItemClick(weekStudyItem.studyId)),
          );
        }).toList();

    return List.generate(
      dayTimeCount,
      (time) => TableRow(
        children: <Widget>[_buildTimeItem(time), ...buildWeekDays(time)],
      ),
    );
  }

  _buildTimeItem(int index) {
    return SizedBox(
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
    );
  }

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
}
