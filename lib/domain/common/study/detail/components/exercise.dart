import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class DetailExercise extends StatelessWidget {
  final String title;
  final int weight;
  final int count;
  final int set;

  const DetailExercise({
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
              style: bodyLarge.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              "${weight}KG · $count회 · $set세트",
              style: bodyLarge.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}
