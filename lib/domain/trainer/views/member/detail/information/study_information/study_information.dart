// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/study_information/summary.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/tickets.dart';

class StudyInformation extends StatelessWidget {
  StudyInformation({super.key});

  onDetailTicketButtonPressed(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const TicketsView(),
      ),
    );
  }

  onDetailInBodyButtonPressed(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const InbodyView(),
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
              child: CustomOutlinedButton(
                onPressed: () => onDetailTicketButtonPressed(context),
                text: '수강권 관리',
              ),
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
}
