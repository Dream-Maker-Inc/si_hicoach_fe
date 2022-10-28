import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class TrainerMypageSummaryView extends StatelessWidget {
  const TrainerMypageSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '이은석 코치님',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: defaultPadding),
              Text(
                '소속 : 오르다 PT 샵',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
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
                const SizedBox(height: defaultPadding),
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
