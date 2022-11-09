import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class GridItem extends StatelessWidget {
  final String name;
  final int weight;
  final int set;
  final int count;

  const GridItem({
    Key? key,
    required this.name,
    required this.weight,
    required this.set,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(name, style: bodyLarge),
        const SizedBox(height: smallPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.fitness_center_rounded,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '${weight}KG',
                  style: bodyMedium.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.repeat_rounded,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '${set}SET',
                  style: bodyMedium.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.timer_outlined,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '$count회',
                  style: bodyMedium.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
