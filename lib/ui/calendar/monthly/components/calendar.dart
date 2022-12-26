// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/calendar_header.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/calendar_item_wrapper.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/holiday_item.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/personal_study_item.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/member_study_item.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/monthly_calendar_vm.dart';

class MonthlyCalendar extends StatefulWidget {
  const MonthlyCalendar({super.key});

  @override
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {
  final vm = Get.find<MonthlyCalendarViewModel>();

  @override
  Widget build(BuildContext context) {
    final weeksDetail = vm.weeksDetail;
    final weeksCount = weeksDetail.length;

    return Column(
      children: [
        const MonthlyCalendarHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: weeksCount,
            itemBuilder: (_, index) {
              final weekDetail = weeksDetail[index];

              return Row(
                children: [_DateRow(weekDetail.dates)],
              );
            },
          ),
        ),
      ],
    );
  }

  // 각 날짜 박스들 - row 렌더링
  Widget _DateRow(List<DateTime> dates) {
    return Expanded(
      child: Row(
        children: dates
            .map(
              (date) => MonthlyCalendarItemWrapper(
                itemDate: date,
                child: Column(
                  children: [
                    _HolidayBox(date),
                    _PersonalStudyItemBox(date),
                    _MemberStudyItemBox(date)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _MemberStudyItemBox(DateTime date) {
    return Obx(() {
      final count = vm.findMemberStudyCountByDate(date);

      if (count <= 0) return Container();
      return MemberStudyItemView(studyCount: count);
    });
  }

  Widget _PersonalStudyItemBox(DateTime date) {
    return Obx(() {
      final count = vm.findPersonalStudyCountByDate(date);

      if (count <= 0) return Container();
      return PersonalStudyItemView(personalStudyCount: count);
    });
  }

  Widget _HolidayBox(DateTime date) {
    return Obx(() {
      final holiday = vm.findHoliday(date);

      if (holiday == null) return Container();
      return HolidayItemView(holidayTitle: holiday.title);
    });
  }
}
