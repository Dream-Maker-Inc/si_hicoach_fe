import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class WeeklyCalendarItem extends StatelessWidget {
  final String? name;
  const WeeklyCalendarItem({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: colorScheme.primary,
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      height: 50,
      child: name != null
          ? Center(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: itemBackground,
                child: Center(
                  child: Text(
                    name!,
                    style: bodySmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
