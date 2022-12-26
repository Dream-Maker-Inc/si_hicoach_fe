// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/monthly_calendar_vm.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/calendar.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';

const WEEK_DAYS = [7, 1, 2, 3, 4, 5, 6];

//
class MonthlyCalendarView extends StatefulWidget {
  final DateTime targetDate;
  final bool isBackButtonEnabled;

  const MonthlyCalendarView({
    super.key,
    required this.targetDate,
    this.isBackButtonEnabled = false,
  });

  @override
  State<MonthlyCalendarView> createState() => _MonthlyCalendarViewState();
}

class _MonthlyCalendarViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: _Appbar(),
      body: const MonthlyCalendar(),
    );
  }

  _Appbar() {
    final DateFormat formatter = DateFormat('yyyy년 MM월');
    final title = formatter.format(vm.targetDate);

    if (widget.isBackButtonEnabled) {
      return CustomAppBarArrowBack(
        titleText: title,
      );
    }

    return CustomAppBarWithLogo(
      titleText: title,
    );
  }
}

class _Detail
    extends MyGetXState<MonthlyCalendarView, MonthlyCalendarViewModel> {
  DateTime get targetDate => widget.targetDate;

  handleWeeklyCalendarItemClick(int studyId) {
    Get.to(
      StudyDetailView(
        studyId: studyId,
        isMemberDetailEnabled: false,
      ),
    )?.then((value) => vm.refetch());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString()).then((value) => Get.back());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        vm.fetchMemberStudies(targetDate),
        vm.fetchHolidaysOfThisMonth(targetDate),
      ]);
    });
    return widget;
  }

  @override
  MonthlyCalendarViewModel createViewModel() =>
      MonthlyCalendarViewModel(targetDate: targetDate);
}
