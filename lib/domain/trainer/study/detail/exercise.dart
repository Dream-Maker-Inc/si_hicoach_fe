import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/divider.dart';

class TrainerMainExercise extends StatelessWidget {
  final String title;
  final int weight;
  final int count;
  final int set;

  const TrainerMainExercise({
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
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(70, 103, 240, 0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${weight}KG · $count회 · $set세트",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
