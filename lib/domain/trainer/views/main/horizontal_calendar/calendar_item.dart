import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerMainCalendarItem extends StatelessWidget {
  final String dayText;
  final int dayNumber;
  final bool highlight;

  const TrainerMainCalendarItem({
    Key? key,
    required this.dayText,
    required this.dayNumber,
    required this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration highlightedDate = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: colorScheme.primary,
    );

    BoxDecoration noHighlightedDate = const BoxDecoration(
      color: Colors.transparent,
    );

    TextStyle highlightedTextStyle = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );

    TextStyle noHighlightedTextStyle = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );

    return Container(
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 7,
        child: Column(
          children: <Widget>[
            Text(dayText, style: Theme.of(context).textTheme.caption),
            const SizedBox(height: smallPadding),
            InkWell(
              onTap: () {},
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
