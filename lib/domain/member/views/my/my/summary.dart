import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/memo.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/mypage_vm.dart';

class SummaryView extends StatelessWidget {
  SummaryView({Key? key}) : super(key: key);

  final _vm = Get.find<MemberMyPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildHeader(),
        Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          child: _buildSummary(),
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
                            const InbodyView(memberId: 1, matchingId: 1),
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

  _buildSummary() {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('헬스장 정보', style: bodyMedium),
                Text(_vm.companyName, style: bodyMedium),
              ],
            ),
            const SizedBox(height: smallPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('담당 코치 정보', style: bodyMedium),
                Text('${_vm.trainerName} 코치님', style: bodyMedium),
              ],
            ),
          ],
        ),
      );
    });
  }

  _buildHeader() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TitleWithDescription(
          title: '${_vm.memberName}님',
          description: '현재 ${_vm.latestRound}회차 · 총 ${_vm.totalTicketCount}회',
        ),
      );
    });
  }
}
