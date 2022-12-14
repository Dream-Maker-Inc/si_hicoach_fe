// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/ui/member/my_page/memo/list/memo_list_view.dart';
import 'package:si_hicoach_fe/ui/member/my_page/main/my_page_vm.dart';

class SummaryView extends StatelessWidget {
  SummaryView({Key? key}) : super(key: key);

  final _vm = Get.find<MemberMyPageViewModel>();

  handleInBodyClick(BuildContext context) {
    Get.to(
      InbodyView(
        memberId: _vm.memberId,
        matchingId: _vm.matchingId,
        isRoleTrainer: false,
      ),
    );
  }

  handleMemoClick(BuildContext context) {
    Get.to(const MyMemoListView());
  }

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
                  onPressed: () => handleMemoClick(context),
                  text: '메모 모아보기',
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () => handleInBodyClick(context),
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
      final notMatchedTrainer = _vm.isNotMatchedTrainer;
      final trainerNameLabel =
          _vm.trainerName.isEmpty ? "" : '${_vm.trainerName} 코치님';

      if (notMatchedTrainer) {
        return Container();
      }

      return Container(
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
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
                Text(trainerNameLabel, style: bodyMedium),
              ],
            ),
          ],
        ),
      );
    });
  }

  _buildHeader() {
    return Obx(() {
      final notMatchedTrainer = _vm.isNotMatchedTrainer;
      final desc = notMatchedTrainer
          ? "매칭된 코치님이 없어요!"
          : '완료 수업 ${_vm.completedStudyCount}회 · 총 ${_vm.totalTicketCount}회';

      return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TitleWithDescription(
          title: '${_vm.memberName}님',
          description: desc,
        ),
      );
    });
  }
}
