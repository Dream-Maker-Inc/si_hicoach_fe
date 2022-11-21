import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/study/common/exercise_add/exercise_add.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';

class EditExercise extends StatelessWidget {
  const EditExercise(
      {Key? key, required this.itemProps, required this.onAddExercise})
      : super(key: key);
  final List<StudyEditExerciseItemProps> itemProps;
  final Function(ExerciseItem exercise) onAddExercise;

  handleAddIconPressed(BuildContext context) async {
    final Map? result = await Get.to(const ExerciseAddView());

    if (result == null) return;

    final ExerciseItem exercise = result['exercise'];

    onAddExercise(exercise);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: Text(
                '운동 일지',
                style: titleLarge.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            IconButton(
              onPressed: () => handleAddIconPressed(context),
              icon: const Icon(Icons.add_rounded),
              color: primaryColor,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  secondaryColor,
                ),
              ),
            ),
          ],
        ),
        // StudyEditExerciseItem(model: it)
        Column(
          children:
              itemProps.map((it) => StudyEditExerciseItem(props: it)).toList(),
        ),
      ],
    );
  }
}
