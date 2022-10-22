import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/exercise_item.dart';

class TrainerMainEditExercise extends StatelessWidget {
  const TrainerMainEditExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        TrainerStudyEditExerciseItem(),
        TrainerStudyEditExerciseItem(),
        TrainerStudyEditExerciseItem(),
        TrainerStudyEditExerciseItem(),
      ],
    );
  }
}
