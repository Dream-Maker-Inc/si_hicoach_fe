import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class MainLatestStudyInfoItem extends StatelessWidget {
  final String name;
  final int weight;
  final int set;
  final int count;

  const MainLatestStudyInfoItem({
    Key? key,
    required this.name,
    required this.weight,
    required this.set,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: smallPadding),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(
                  Icons.fitness_center_rounded,
                  size: 16,
                  color: Colors.black,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '${weight}kg',
                  style: bodyMedium.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.repeat_rounded,
                  size: 16,
                  color: Colors.black,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '${set}set',
                  style: bodyMedium.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.timer_outlined,
                  size: 16,
                  color: Colors.black,
                ),
                const SizedBox(width: smallPadding),
                Text(
                  '$count회',
                  style: bodyMedium.copyWith(
                    color: Colors.black,
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
