import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberMainStudiesView extends StatelessWidget {
  const MemberMainStudiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '수업 일자 : 2022년 10월 10일',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            flex: 1,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: List.generate(
                6,
                (int index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(smallPadding),
                    ),
                  ),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        '벤치프레스',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: smallPadding),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.fitness_center_rounded),
                          const SizedBox(width: smallPadding),
                          Text(
                            '50KG',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: smallPadding),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.repeat_rounded),
                          const SizedBox(width: smallPadding),
                          Text(
                            '3SET',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: smallPadding),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.timer_outlined),
                          const SizedBox(width: smallPadding),
                          Text(
                            '50회',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
