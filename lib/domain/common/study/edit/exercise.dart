import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/exercise_item.dart';

class StudyEditExercise extends StatelessWidget {
  const StudyEditExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        StudyEditExerciseItem(),
        StudyEditExerciseItem(),
        StudyEditExerciseItem(),
        StudyEditExerciseItem(),
      ],
    );
  }
}
