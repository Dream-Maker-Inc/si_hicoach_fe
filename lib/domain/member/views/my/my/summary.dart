import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/memo.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: TitleWithDescription(
            title: '이은석 회원님',
            description: '현재 4회차 · 총 30회',
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
                    Text('헬스장 정보', style: bodyMedium),
                    Text('오르다 PT 샵', style: bodyMedium),
                  ],
                ),
                const SizedBox(height: smallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('담당 코치 정보', style: bodyMedium),
                    Text('이은석 코치님', style: bodyMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MemoListView(),
                      ),
                    );
                  },
                  text: '메모 모아보기',
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            InbodyView(memberId: 1, matchingId: 1),
                      ),
                    );
                  },
                  text: '인바디 데이터',
                ),
              ),
            ],
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
