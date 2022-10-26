import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/divider.dart';
import 'package:si_hicoach_fe/domain/trainer/main/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/main/hello.dart';
import 'package:si_hicoach_fe/domain/trainer/main/todo_item.dart';

class TrainerHomeView extends StatefulWidget {
  const TrainerHomeView({Key? key}) : super(key: key);

  @override
  State<TrainerHomeView> createState() => _TrainerHomeViewState();
}

class _TrainerHomeViewState extends State<TrainerHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: colorScheme.onTertiary,
            height: 1,
          ),
        ),
      ),
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
                  (int index) =>  TrainerMainTodoItem(
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