import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/calendar/monthly/components/items/base_item.dart';

// 개인 일정 표시 아이템
class PersonalStudyItemView extends StatelessWidget {
  final int personalStudyCount;

  const PersonalStudyItemView({
    super.key,
    this.personalStudyCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "개인 $personalStudyCount",
      child: BaseMonthlyCalendarItem(
        itemBackground: BoxDecoration(
          color: primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(4),
        ),
        text: personalStudyCount.toString(),
        icon: const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
