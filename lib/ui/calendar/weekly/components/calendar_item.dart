// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

const List<Color> _COLOR_LIST = [
  Color(0xff5A5EE6),
  Color(0xff5B80FF),
  Color(0xff4BB0FF),
];

_getRandomColor() {
  final index = Random().nextInt(_COLOR_LIST.length);
  return _COLOR_LIST[index];
}

//
class WeeklyCalendarItem extends StatelessWidget {
  final String name;

  const WeeklyCalendarItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _getRandomColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          name,
          style: bodySmall.copyWith(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
