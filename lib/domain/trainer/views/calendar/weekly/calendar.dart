import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/study.dart';
import 'package:si_hicoach_fe/domain/trainer/views/calendar/monthly/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/calendar/weekly/components/calendar.dart';

const List<String> list = <String>['9월 1주차', '30월 1주차', '11월 1주차', '12월 1주차'];

class TrainerWeeklyCalendarView extends StatefulWidget {
  const TrainerWeeklyCalendarView({super.key});

  @override
  State<TrainerWeeklyCalendarView> createState() =>
      _TrainerWeeklyCalendarViewState();
}

class _TrainerWeeklyCalendarViewState extends State<TrainerWeeklyCalendarView> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    Widget appBarTitle() {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        underline: Container(height: 2, color: Colors.transparent),
        onChanged: (String? value) {
          setState(() => dropdownValue = value!);
        },
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        title: appBarTitle(),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const StudyEditView(),
                ),
              );
            },
            icon: const Icon(Icons.add_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const TrainerMonthlyCalendar(),
                ),
              );
            },
            icon: const Icon(Icons.calendar_month_rounded),
          ),
        ],
      ),
      body: const WeeklyCalendar(),
    );
  }
}
