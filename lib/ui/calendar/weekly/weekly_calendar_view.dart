// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/monthly_calendar_view.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/weekly_calendar_vm.dart';

class WeeklyCalendarView extends StatefulWidget {
  const WeeklyCalendarView({super.key});

  @override
  State<WeeklyCalendarView> createState() => _WeeklyCalendarViewState();
}

class _WeeklyCalendarViewState extends _Detail {
  final swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: _Appbar(),
      body: const WeeklyCalendar(),
    );
  }

  _Appbar() {
    return AppBar(
      leading: const IconButton(
        icon: SizedBox(
          width: 20,
          child: Image(image: AssetImage('assets/icon.png')),
        ),
        onPressed: null,
      ),
      title: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(children: [
          _LeftSwipeIconButton(),
          Expanded(child: _AppbarTitle()),
          _RightswipeIconButton(),
        ]),
      ),
      actions: [
        IconButton(
          onPressed: handleMonthCalendarClick,
          icon: const Icon(Icons.calendar_month_rounded),
        ),
      ],
    );
  }

  Widget _RightswipeIconButton() {
    return Tooltip(
      message: "다음주로 스와이프",
      child: IconButton(
        onPressed: () {
          swiperController.next();
        },
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: primaryColor.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _LeftSwipeIconButton() {
    return Tooltip(
      message: "저번주로 스와이프",
      child: IconButton(
        onPressed: () {
          swiperController.previous();
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: primaryColor.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _AppbarTitle() {
    return Obx(() {
      final weekModels = vm.monthWeeks;
      final initialIndex = vm.initialSwiperIndex.value;

      return Swiper(
        outer: false,
        itemCount: weekModels.length,
        itemBuilder: (context, index) {
          final item = weekModels[index];

          return Container(
            alignment: Alignment.center,
            child: Text(item),
          );
        },
        onIndexChanged: (index) {
          vm.swiperIndex.value = index;
        },
        controller: swiperController,
        index: initialIndex,
        duration: 1,
      );
    });
  }
}

class _Detail extends MyGetXState<WeeklyCalendarView, WeeklyCalendarViewModel> {
  handleMonthCalendarClick() {
    Get.to(
      MonthlyCalendarView(
        targetDate: vm.targetDate,
        isBackButtonEnabled: true,
      ),
    )?.then((_) => vm.refetch());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.refetch()]);
    });
    return widget;
  }

  @override
  WeeklyCalendarViewModel createViewModel() => WeeklyCalendarViewModel();
}

extension WeekModelExtension on WeekModel {
  String get thisWeekLabel =>
      DateTime.now().isThisWeek(year, month, week) ? " (이번주)" : "";

  String get label => "$month월 $week주차$thisWeekLabel";
}
