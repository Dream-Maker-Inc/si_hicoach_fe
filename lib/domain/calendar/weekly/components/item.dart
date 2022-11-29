import 'dart:math';

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class WeeklyCalendarItemProps {
  final String name;
  final VoidCallback onClick;

  WeeklyCalendarItemProps({required this.name, required this.onClick});
}

class WeeklyCalendarItem extends StatelessWidget {
  final WeeklyCalendarItemProps? props;
  WeeklyCalendarItem({super.key, this.props});

  final List<Color> colorList = const [
    Color(0xff5A5EE6),
    Color(0xff5B80FF),
    Color(0xff4BB0FF),
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: colorList[_random.nextInt(colorList.length)],
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      height: 50,
      child: props != null
          ? Center(
              child: _buildItem(itemBackground),
            )
          : Container(),
    );
  }

  _buildItem(BoxDecoration itemBackground) {
    final String name = props!.name;
    final VoidCallback onClick = props!.onClick;

    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: itemBackground,
        child: Center(
          child: Text(
            name,
            style: bodySmall.copyWith(
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
