import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerMainCalendarItem extends StatelessWidget {
  final String day;
  final String date;

  const TrainerMainCalendarItem({
    Key? key,
    required this.day,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: 58,
        child: Column(
          children: <Widget>[
            Text(day, style: Theme.of(context).textTheme.caption),
            const SizedBox(height: smallPadding),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorScheme.primary,
              ),
              child: Center(
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
