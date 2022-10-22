import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('운동 일지 상세'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
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
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: colorScheme.onTertiary, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  '이은석 회원님',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.link_rounded),
                  onPressed: () {},
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                '2022년 9월 30일',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: widePadding),
            const TrainerStudyDetailTime(),
            const SizedBox(height: widePadding),
            Column(
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '운동 일지',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                ),
                const TrainerMainExercise(),
                const TrainerMainExercise(),
                const TrainerMainExercise(),
                const SizedBox(height: 16),
                Divider(thickness: 1, height: 1, color: colorScheme.onTertiary),
              ],
            ),
            const SizedBox(height: widePadding),
            const TrainerExerciseDetailMemo(),
          ],
        ),
      ),
    );
  }
}
