import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/alert.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/study/detail/exercise.dart';
import 'package:si_hicoach_fe/domain/trainer/study/detail/memo.dart';
import 'package:si_hicoach_fe/domain/trainer/study/detail/time.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/study.dart';

class TrainerStudyDetailView extends StatelessWidget {
  const TrainerStudyDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TrainerStudyEditView(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => CustomAlertDialog(
                  title: '회원 삭제',
                  content: '회원을 삭제하면 해당 회원의 수업 예약 내역이 모두 삭제됩니다.',
                  positiveText: '삭제',
                  onPositivePressed: () => Navigator.of(context).pop(),
                  negativeText: '취소',
                  onNegativePressed: () => Navigator.pop(context, true),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '이은석 회원님',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  IconButton(
                    icon: const Icon(Icons.link_rounded),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '2022년 9월 30일',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const SizedBox(height: widePadding),
              const TrainerStudyDetailTime(),
              const SizedBox(height: widePadding),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '운동 일지',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const TrainerMainExercise(
                    title: '푸시업',
                    weight: 12,
                    count: 34,
                    set: 56,
                  ),
                  const TrainerMainExercise(
                    title: '벤치프레스',
                    weight: 12,
                    count: 34,
                    set: 56,
                  ),
                  const TrainerMainExercise(
                    title: '윗몸일으키기',
                    weight: 12,
                    count: 34,
                    set: 56,
                  ),
                  const SizedBox(height: 16),
                  Divider(
                      thickness: 1, height: 1, color: colorScheme.onTertiary),
                ],
              ),
              const SizedBox(height: widePadding),
              const TrainerExerciseDetailMemo(),
            ],
          ),
        ),
      ),
    );
  }
}
