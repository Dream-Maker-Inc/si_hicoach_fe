import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class TrainerMypageSummaryView extends StatelessWidget {
  const TrainerMypageSummaryView({
    Key? key,
    required this.name,
    required this.currentStudy,
    required this.pastStudy,
  }) : super(key: key);

  final String name;
  final int currentStudy;
  final int pastStudy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: TitleWithDescription(
            title: '$name 코치님',
            description: '소속 : 오르다 PT 샵',
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          child: Container(
            margin: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('저번 달 완료 수업 (총합)', style: bodyMedium),
                    Text('$currentStudy개', style: bodyMedium),
                  ],
                ),
                const SizedBox(height: smallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('저번 달 완료 수업 (총합)', style: bodyMedium),
                    Text('$pastStudy개', style: bodyMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
