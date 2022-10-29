import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/hello.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/todo_item.dart';

class TrainerHomeView extends StatefulWidget {
  const TrainerHomeView({Key? key}) : super(key: key);

  @override
  State<TrainerHomeView> createState() => _TrainerHomeViewState();
}

class _TrainerHomeViewState extends State<TrainerHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '메인'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const TrainerMainHello(),
            const SizedBox(height: widePadding),
            const TrainerMainCalendar(),
            const CustomDivider(),
            Expanded(
              child: ListView(
                children: List.generate(
                  24,
                  (int index) => TrainerMainTodoItem(
                    time: index,
                    name: '한장현',
                    isCompleted: true,
                    currentStudy: 10,
                    totalStudy: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
