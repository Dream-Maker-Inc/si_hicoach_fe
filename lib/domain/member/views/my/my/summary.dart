import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/inbody/inbody.dart';

class MemberMypageSummaryView extends StatelessWidget {
  const MemberMypageSummaryView({Key? key}) : super(key: key);

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
                '이은석 회원님',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: defaultPadding),
              Text(
                '4회차 / 총 30회',
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
                      '헬스장 정보',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '오르다 PT 샵',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '담당 코치 정보',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '이은석 코치님',
                      style: Theme.of(context).textTheme.headline4,
                    ),
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
                  onPressed: () {},
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
                            const MemberInbodyView(),
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
