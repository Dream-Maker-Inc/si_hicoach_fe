import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';

class Summary extends StatelessWidget {
  Summary({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    final latestStudy = _vm.latestStudy;

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
                Text('수업 등록 일자', style: bodyMedium),
                Text(latestStudy.startedAt.toKoreanFormat, style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('진행한 수업 횟수', style: bodyMedium),
                Text('${latestStudy.finishedStudyCount}회', style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('잔여 수업 횟수', style: bodyMedium),
                Text('${latestStudy.totalStudyCount}회', style: bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
