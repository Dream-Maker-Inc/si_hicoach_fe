import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/todo_list/list_item.dart';

class MainProps {
  final int time;
  final String name;
  final bool isCompleted;
  final int currentStudy;
  final int totalStudy;

  MainProps(
    this.time,
    this.name,
    this.isCompleted,
    this.currentStudy,
    this.totalStudy,
  );
}

class TrainerMainView extends StatelessWidget {
  TrainerMainView({Key? key}) : super(key: key);

  final List<int> timeList = List.empty(growable: true);
  final List<MainProps> list = [
    MainProps(9, '한장현', true, 10, 20),
    MainProps(10, '홍길동', true, 10, 20),
    MainProps(11, '이은석', true, 10, 20),
    MainProps(12, '김종완', false, 10, 20),
    MainProps(13, '한장현', false, 10, 20),
    MainProps(14, '홍길동', false, 10, 20),
    MainProps(15, '이은석', false, 10, 20),
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 24; i++) {
      timeList.add(i);
    }

    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '메인'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TitleWithDescription(
                title: '반갑습니다, 은석 코치님',
                description: Utils.getCurrentDateTime('year_month_date'),
              ),
            ),
            const Calendar(),
            const CustomDivider(),
            Expanded(
                child: ListView(
              children: List.of(
                list.map(
                  (it) => TrainerMainTodoItem(
                    time: it.time,
                    name: it.name,
                    isCompleted: it.isCompleted,
                    currentStudy: it.currentStudy,
                    totalStudy: it.totalStudy,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
