import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/base_item.dart';

// 개인 일정 표시 아이템
class MemberStudyItemView extends StatelessWidget {
  final int studyCount;

  const MemberStudyItemView({
    super.key,
    this.studyCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "수업 $studyCount개",
      child: BaseMonthlyCalendarItem(
        itemBackground: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        text: studyCount.toString(),
        icon: const Icon(
          Icons.fitness_center_rounded,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
