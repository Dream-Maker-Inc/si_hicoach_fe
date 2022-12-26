// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/calendar/common/calendar_common.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar_header.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar_item.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar_item_wrapper.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/weekly_calendar_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list-popup/member_list_popup.dart';

const DAY_TIME_COUNT = 24;
const WEEK_DAYS = [7, 1, 2, 3, 4, 5, 6];

//
class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  WeeklyCalendarViewModel vm = Get.find<WeeklyCalendarViewModel>();

  handleWeeklyCalendarItemClick(int studyId) {
    Get.to(StudyDetailView(
      studyId: studyId,
      isMemberDetailEnabled: false,
    ))?.then((_) => vm.refetch());
  }

  handleEmptyCalendarItemClick(int time, int weekDay) async {
    final targetDateTime = vm.getDateTimeByTimeAndWeekDay(time, weekDay);
    if (targetDateTime == null) return;

    Get.dialog(
      TrainerMemberListPopup(
        targetDateTime: targetDateTime,
        onSuccess: () => vm.refetch(),
      ),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WeeklyCalendarHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: DAY_TIME_COUNT,
            itemBuilder: (_, time) {
              return Row(
                children: [
                  _TimeItem(time),
                  _WeekDaysRow(time),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // 각 요일 박스들 - row 렌더링
  Widget _WeekDaysRow(int time) {
    Widget mapToCalendarItem(int weekDay) {
      final data = vm.findDataByTimeAndWeekDay(time, weekDay);
      final isDataNull = (data == null);

      final onClick = isDataNull
          ? () => handleEmptyCalendarItemClick(time, weekDay)
          : () => handleWeeklyCalendarItemClick(data.study.id);

      final child =
          isDataNull ? Container() : WeeklyCalendarItem(name: data.member.name);

      return WeeklyCalendarItemWrapper(
        onClick: onClick,
        child: child,
      );
    }

    return Obx(() {
      return Expanded(
          child: Row(
        children: WEEK_DAYS.map(mapToCalendarItem).toList(),
      ));
    });
  }

  // 시간 아이템
  _TimeItem(int index) {
    final time = index.toString();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: calendarBorder,
          bottom: calendarBorder,
        ),
      ),
      width: getWeeklyCalendarTimeItemWidth(context),
      height: weeklyCalendarItemHeight,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          time,
          style: bodySmall.copyWith(
            color: Colors.grey.shade500,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
