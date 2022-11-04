import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/todo_list/list_item.dart';

class TrainerMainView extends StatefulWidget {
  const TrainerMainView({Key? key}) : super(key: key);

  @override
  State<TrainerMainView> createState() => _TrainerMainViewState();
}

class _TrainerMainViewState extends State<TrainerMainView> {
  List<int> timeList = List.empty(growable: true);

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
              child: ListView.builder(
                itemCount: timeList.length,
                itemBuilder: (_, int index) {
                  return TrainerMainTodoItem(
                    time: timeList.elementAt(index),
                    name: '한장현',
                    isCompleted: true,
                    currentStudy: 10,
                    totalStudy: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
