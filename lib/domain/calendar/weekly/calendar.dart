import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/weekly_calendar_vm.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/calendar.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/components/calendar.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class WeeklyCalendarView extends StatefulWidget {
  const WeeklyCalendarView({super.key});

  @override
  State<WeeklyCalendarView> createState() => _WeeklyCalendarViewState();
}

class _WeeklyCalendarViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        title: _buildAppBarTitle(),
        actions: <Widget>[
          IconButton(
            onPressed: handleMonthCalendarClick,
            icon: const Icon(Icons.calendar_month_rounded),
          ),
        ],
      ),
      body: const WeeklyCalendar(),
    );
  }

  _buildAppBarTitle() {
    handleTargetWeekChange(String? v) {
      if (v == null) return;

      vm.targetWeek.value = v;
    }

    return Obx(() {
      final weeks = vm.weekModels;
      final targetWeekId = vm.targetWeek.value;

      if (targetWeekId.isEmpty) return Container();

      return DropdownButton<String>(
        value: targetWeekId,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: titleMedium.copyWith(fontWeight: FontWeight.w400),
        underline: Container(height: 2, color: Colors.transparent),
        onChanged: handleTargetWeekChange,
        items: weeks.map<DropdownMenuItem<String>>(
          (week) {
            return DropdownMenuItem<String>(
              value: week.weekString,
              child: Text(week.formattedWeek),
            );
          },
        ).toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<WeeklyCalendarView, WeeklyCalendarViewModel> {
  handleMonthCalendarClick() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                const MonthlyCalendarView(isBackButtonEnabled: true),
          ),
        )
        .then((value) => vm.fetchMemberStudies());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          onConfirm: () {
            Get.back();
          });
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
  WeeklyCalendarViewModel createViewModel() => WeeklyCalendarViewModel();
}
