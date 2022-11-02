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
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: 0.985,
              ),
              itemBuilder: (_, __) => Container(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
