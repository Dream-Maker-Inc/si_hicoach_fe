import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

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

  Widget listItem(BuildContext context, Widget icon, String text) {
    return Row(
      children: <Widget>[
        icon,
        const SizedBox(width: smallPadding),
        Text(text, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: widePadding),
        listItem(
          context,
          const Icon(Icons.fitness_center_rounded),
          "${weight}KG",
        ),
        const SizedBox(height: smallPadding),
        listItem(
          context,
          const Icon(Icons.repeat_rounded),
          "${set}SET",
        ),
        const SizedBox(height: smallPadding),
        listItem(
          context,
          const Icon(Icons.timer_outlined),
          "$count회",
        ),
      ],
    );
  }
}
