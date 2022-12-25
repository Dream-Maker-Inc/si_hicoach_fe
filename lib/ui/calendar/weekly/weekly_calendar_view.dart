// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/calendar.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/components/calendar.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/weekly_calendar_vm.dart';

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
        child: _AppbarTitle(),
      ),
      actions: [
        IconButton(
          onPressed: handleMonthCalendarClick,
          icon: const Icon(Icons.calendar_month_rounded),
        ),
      ],
    );
  }

  Widget _AppbarTitle() {
    return Obx(() {
      final weekModels = vm.weekModels;
      final initialIndex = vm.initialSwiperIndex.value;

      return Swiper(
          outer: false,
          itemCount: weekModels.length,
          itemBuilder: (context, index) {
            final item = weekModels[index];

            return Container(
              alignment: Alignment.center,
              child: Text(item.label),
            );
          },
          onIndexChanged: (index) {
            vm.swiperIndex.value = index;
          },
          index: initialIndex);
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
