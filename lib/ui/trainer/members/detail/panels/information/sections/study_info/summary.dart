import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/common/utils/number_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';

class Summary extends StatelessWidget {
  Summary({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    final matchedAt = _vm.matchedAt;
    final completedStudyCount = _vm.completedStudyCount;
    final remainingTicketCount = _vm.remainingTicketCount;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('PT 등록 일자', style: bodyMedium),
                Text(matchedAt.toKoreanFormat, style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('진행한 수업 횟수', style: bodyMedium),
                Text('${completedStudyCount.toKC}회', style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('잔여 수업 횟수', style: bodyMedium),
                Text('${remainingTicketCount.toKC}회', style: bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
