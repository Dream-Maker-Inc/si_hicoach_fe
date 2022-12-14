import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/number_format.dart';

class TrainerMypageSummaryView extends StatelessWidget {
  const TrainerMypageSummaryView({
    Key? key,
    required this.name,
    required this.companyName,
    required this.currentStudy,
    required this.pastStudy,
  }) : super(key: key);

  final String name;
  final String companyName;
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
            description: '소속 : $companyName',
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
                    Text('이번 달 완료 수업 (총합)', style: bodyMedium),
                    Text('${currentStudy.toKC}개', style: bodyMedium),
                  ],
                ),
                const SizedBox(height: smallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('저번 달 완료 수업 (총합)', style: bodyMedium),
                    Text('${pastStudy.toKC}개', style: bodyMedium),
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
