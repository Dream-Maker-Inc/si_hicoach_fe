import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class CalendarItem extends StatelessWidget {
  final String dayText;
  final int dayNumber;
  final bool highlight;
  final GestureTapCallback? onTap;

  const CalendarItem({
    Key? key,
    required this.dayText,
    required this.dayNumber,
    required this.highlight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration highlightedDate = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: primaryColor,
    );

    BoxDecoration noHighlightedDate = const BoxDecoration(
      color: Colors.transparent,
    );

    TextStyle highlightedTextStyle = titleMedium.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );

    TextStyle noHighlightedTextStyle = titleMedium.copyWith(
      fontWeight: FontWeight.w400,
    );

    return Container(
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 7,
        child: Column(
          children: <Widget>[
            Text(
              dayText,
              style: bodySmall.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: smallPadding),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: highlight ? highlightedDate : noHighlightedDate,
                child: Center(
                  child: Text(
                    dayNumber.toString(),
                    style: highlight
                        ? highlightedTextStyle
                        : noHighlightedTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
