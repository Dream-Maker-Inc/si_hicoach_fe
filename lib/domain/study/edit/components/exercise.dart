import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/study/edit/add/exercise_add.dart';
import 'package:si_hicoach_fe/domain/study/edit/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/edit/study.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class EditExercise extends StatelessWidget {
  const EditExercise({Key? key, required this.list}) : super(key: key);
  final List<StudyProps> list;

  @override
  Widget build(BuildContext context) {
    handleAddIconPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StudyEditExerciseAdd(),
        ),
      );
    }

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
              onPressed: handleAddIconPressed,
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
        Column(
          children: list
              .map(
                (it) => StudyEditExerciseItem(
                  count: it.count,
                  name: it.name,
                  set: it.set,
                  weight: it.weight,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
