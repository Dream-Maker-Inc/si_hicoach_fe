import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class TrainerMypageSummaryView extends StatelessWidget {
  const TrainerMypageSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: TitleWithDescription(
            title: '이은석 코치님',
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
                    Text(
                      '저번 달 완료 수업 (총합)',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '80개',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: smallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '저번 달 완료 수업 (총합)',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '80개',
                      style: Theme.of(context).textTheme.headline4,
                    ),
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
