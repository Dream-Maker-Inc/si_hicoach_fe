import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class MonthlyCalendarItem extends StatelessWidget {
  final Color dayTextColor;

  final int? date;
  final int studyCount;
  final int personalStudyCount;
  final String holidayText;
  final VoidCallback? onClick;

  const MonthlyCalendarItem(
      {super.key,
      required this.dayTextColor,
      this.studyCount = 0,
      this.personalStudyCount = 0,
      this.holidayText = "",
      this.date,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5 - 22,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 4),
          Text(
            date?.toString() ?? "",
            style: bodySmall.copyWith(color: dayTextColor),
          ),
          _buildHolidayItem(context),
          _buildStudyItem(context),
          _buildPersonalStudyItem(context)
        ],
      ),
    );
  }

  _buildStudyItem(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(4),
    );

    const icon = Icon(
      Icons.fitness_center_rounded,
      color: Colors.white,
      size: 12,
    );

    final item = (studyCount > 0)
        ? _buildItem(itemBackground, studyCount.toString(), icon)
        : Container();

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: Tooltip(message: "수업 $studyCount개", child: item),
    );
  }

  _buildPersonalStudyItem(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: primaryColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(4),
    );

    const icon = Icon(
      Icons.account_circle,
      color: Colors.white,
      size: 12,
    );

    final item = (personalStudyCount > 0)
        ? _buildItem(itemBackground, personalStudyCount.toString(), icon)
        : Container();

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: Tooltip(message: "개인 $personalStudyCount", child: item),
    );
  }

  _buildHolidayItem(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: Colors.redAccent.shade100,
      borderRadius: BorderRadius.circular(4),
    );

    const icon = Icon(
      Icons.home,
      color: Colors.white,
      size: 12,
    );

    final item = (holidayText.isNotEmpty)
        ? _buildItem(itemBackground, "1", icon)
        : Container();

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: Tooltip(message: holidayText, child: item),
    );
  }

  _buildItem(BoxDecoration itemBackground, String text, Icon icon) {
    return InkWell(
      onTap: onClick,
      child: Container(
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
      ),
    );
  }
}
