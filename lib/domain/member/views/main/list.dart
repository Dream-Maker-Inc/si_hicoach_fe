import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class StudyList extends StatelessWidget {
  final Map<String, String> data;

  const StudyList({Key? key, required this.data}) : super(key: key);

  Widget listItem(BuildContext context, Widget icon, String text) {
    return Row(
      children: <Widget>[
        icon,
        const SizedBox(width: smallPadding),
        Text(text, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          data['name']!,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: smallPadding),
        listItem(
          context,
          const Icon(Icons.fitness_center_rounded),
          "${data['weight']!}KG",
        ),
        const SizedBox(height: smallPadding),
        listItem(
          context,
          const Icon(Icons.repeat_rounded),
          "${data['set']!}SET",
        ),
        const SizedBox(height: smallPadding),
        listItem(
          context,
          const Icon(Icons.timer_outlined),
          "${data['count']!}회",
        ),
        const SizedBox(height: smallPadding),
      ],
    );
  }
}
