// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/ui/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/information/sections/study_info/summary.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/tickets/tickets.dart';

class StudyInformation extends StatelessWidget {
  StudyInformation({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  int get _memberId => _vm.memberId;
  int get _matchingId => _vm.matchingId;

  onDetailTicketButtonPressed(BuildContext ctx) {
    Get.to(TicketsView(matchingId: _matchingId))?.then((_) => _vm.refetch());
  }

  onDetailInBodyButtonPressed(BuildContext ctx) {
    Get.to(
      InbodyView(
        memberId: _memberId,
        matchingId: _matchingId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleWithDescription(
          title: '수업 정보',
          description: '회원님의 수업 정보입니다.',
        ),
        Summary(),
        const SizedBox(height: smallPadding),
        Row(
          children: <Widget>[
            Expanded(
              child: _buildTicketManageButton(context),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: CustomOutlinedButton(
                onPressed: () => onDetailInBodyButtonPressed(context),
                text: '인바디 데이터',
              ),
            )
          ],
        ),
      ],
    );
  }

  _buildTicketManageButton(BuildContext context) {
    return Obx(() {
      final onClick = _vm.isPersonalMatching.value
          ? null
          : () => onDetailTicketButtonPressed(context);

      return CustomOutlinedButton(
        onPressed: onClick,
        text: '수강권 관리',
      );
    });
  }
}
