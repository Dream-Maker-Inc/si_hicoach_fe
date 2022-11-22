import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class MonthlyCalendarItem extends StatelessWidget {
  final Color dayTextColor;

  final int? date;
  final String? studyText;
  final String? personalStudyText;
  final String? holidayText;
  final VoidCallback? onClick;

  const MonthlyCalendarItem(
      {super.key,
      required this.dayTextColor,
      this.studyText,
      this.personalStudyText,
      this.holidayText,
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

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: studyText != null
          ? _buildItem(itemBackground, studyText!)
          : Container(),
    );
  }

  _buildPersonalStudyItem(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: primaryColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: (personalStudyText != null)
          ? _buildItem(itemBackground, personalStudyText!)
          : Container(),
    );
  }

  _buildHolidayItem(BuildContext context) {
    BoxDecoration itemBackground = BoxDecoration(
      color: Colors.redAccent.shade100,
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: (holidayText != null)
          ? _buildItem(itemBackground, holidayText!)
          : Container(),
    );
  }

  _buildItem(BoxDecoration itemBackground, String text) {
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
        child: Text(
          text,
          style: bodySmall.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
