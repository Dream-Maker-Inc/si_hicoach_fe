import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class StudyDetailExercise extends StatelessWidget {
  final String title;
  final int weight;
  final int count;
  final int set;

  const StudyDetailExercise({
    Key? key,
    required this.title,
    required this.weight,
    required this.count,
    required this.set,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        const CustomDivider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, color: colorScheme.primary),
            ),
            Text(
              "${weight}KG · $count회 · $set세트",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
