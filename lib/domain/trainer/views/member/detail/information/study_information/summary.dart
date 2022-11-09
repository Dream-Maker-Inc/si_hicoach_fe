import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';

class Summary extends StatelessWidget {
  Summary({Key? key}) : super(key: key);
  final String regDate = Utils.getCurrentDateTime('year_month_date');
  final int currentStudy = 2;
  final int totalStudy = 26;

  @override
  Widget build(BuildContext context) {
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
                Text(regDate, style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('진행한 수업 횟수', style: bodyMedium),
                Text('$currentStudy회', style: bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('잔여 수업 횟수', style: bodyMedium),
                Text('$totalStudy회', style: bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
