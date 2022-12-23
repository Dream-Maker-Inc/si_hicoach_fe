import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/header.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/item.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/weekly_calendar_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list-popup/member_list_popup.dart';

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

    // 각 요일 박스 가로 순차 렌더링
    buildWeekDays(int time) => weekDays.map((weekDay) {
          final targetStudyItem = weekStudyItems.firstWhereOrNull(
              (it) => (it.startedTime == time) && (it.weekDay == weekDay));

          if (targetStudyItem == null) {
            return _buildEmptyWeekdayItem(weekDay: weekDay, time: time);
          }

          return WeeklyCalendarItem(
            props: WeeklyCalendarItemProps(
                name: targetStudyItem.title,
                onClick: () =>
                    handleWeeklyCalendarItemClick(targetStudyItem.studyId)),
          );
        }).toList();

    return List.generate(
      dayTimeCount,
      (time) => TableRow(
        children: <Widget>[_buildTimeItem(time), ...buildWeekDays(time)],
      ),
    );
  }

  // 캘린더 아이템이 없을 때, 대체 컴포넌트
  Widget _buildEmptyWeekdayItem({required int time, required int weekDay}) {
    final targetDate = vm.findDayByWeekDay(weekDay);
    final targetDateTime =
        DateTime(targetDate.year, targetDate.month, targetDate.day, time);

    return InkWell(
        onTap: () {
          Get.dialog(
              MemberListPopup(
                targetDateTime: targetDateTime,
                onSuccess: () => vm.fetchMemberStudies(),
              ),
              barrierDismissible: true);
        },
        child: WeeklyCalendarItem());
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
    Get.to(StudyDetailView(
      studyId: studyId,
      isMemberDetailEnabled: false,
    ))?.then((_) => vm.fetchMemberStudies());
  }
}
