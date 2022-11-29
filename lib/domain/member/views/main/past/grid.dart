import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/member/views/main/past/grid_item.dart';

class StudyProps {
  final String name;
  final int weight;
  final int set;
  final int count;

  StudyProps(this.name, this.weight, this.set, this.count);
}

class PastGridView extends StatelessWidget {
  PastGridView({Key? key}) : super(key: key);

  final List<StudyProps> list = [
    StudyProps('벤치프레스', 1, 2, 3),
    StudyProps('푸쉬업', 2, 3, 4),
    StudyProps('윗몸', 3, 4, 5),
    StudyProps('벤치프레스', 1, 2, 3),
    StudyProps('푸쉬업', 2, 3, 4),
    StudyProps('윗몸', 3, 4, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: defaultPadding,
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '수업 일자 : 2022년 10월 10일',
              style: bodyMedium.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: smallPadding),
            Column(
              children: List.from(
                list.map(
                  (it) => Container(
                    margin: const EdgeInsets.only(bottom: defaultPadding),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(smallPadding),
                      ),
                    ),
                    padding: const EdgeInsets.all(defaultPadding),
                    child: GridItem(
                      name: it.name,
                      count: it.count,
                      set: it.set,
                      weight: it.weight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
