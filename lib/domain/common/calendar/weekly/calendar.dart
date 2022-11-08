import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/study.dart';
import 'package:si_hicoach_fe/domain/common/calendar/monthly/calendar.dart';
import 'package:si_hicoach_fe/domain/common/calendar/weekly/components/calendar.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

const List<String> list = <String>[
  '9월 1주차',
  '9월 2주차',
  '9월 3주차',
  '9월 4주차',
  '9월 5주차'
];

class WeeklyCalendarView extends StatefulWidget {
  const WeeklyCalendarView({super.key});

  @override
  State<WeeklyCalendarView> createState() => _WeeklyCalendarViewState();
}

class _WeeklyCalendarViewState extends State<WeeklyCalendarView> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    Widget appBarTitle() {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: titleMedium.copyWith(fontWeight: FontWeight.w400),
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
                  builder: (BuildContext context) => StudyEditView(),
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
                      const MonthlyCalendarView(),
                ),
              );
            },
            icon: const Icon(Icons.calendar_month_rounded),
          ),
        ],
      ),
      body: WeeklyCalendar(),
    );
  }
}
