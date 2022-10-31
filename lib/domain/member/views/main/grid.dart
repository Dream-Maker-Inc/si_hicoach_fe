import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/member/views/main/list.dart';

class MemberMainGridView extends StatelessWidget {
  const MemberMainGridView({Key? key}) : super(key: key);

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
              children: List.of(
                [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(smallPadding),
                      ),
                    ),
                    padding: const EdgeInsets.all(defaultPadding),
                    child: const StudyList(
                      data: {
                        'name': '벤치프레스',
                        'weight': '1',
                        'set': '2',
                        'count': '3',
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
