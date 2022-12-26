import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class BaseMonthlyCalendarItem extends StatelessWidget {
  final BoxDecoration itemBackground;
  final String text;
  final Icon icon;

  const BaseMonthlyCalendarItem({
    super.key,
    required this.itemBackground,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 4,
        left: 4,
        right: 4,
      ),
      padding: const EdgeInsets.all(2),
      decoration: itemBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          icon,
          const SizedBox(width: 2),
          Text(
            text,
            style: bodySmall.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
