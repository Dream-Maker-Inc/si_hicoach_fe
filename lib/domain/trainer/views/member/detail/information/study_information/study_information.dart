import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/inbody/inbody.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/study_information/summary.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/tickets.dart';

class StudyInformation extends StatelessWidget {
  const StudyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onDetailTicketButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const TicketsView(),
        ),
      );
    }

    onDetailInbodyButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const InbodyView(),
        ),
      );
    }

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
                onPressed: onDetailTicketButtonPressed,
                text: '수강권 관리',
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: CustomOutlinedButton(
                onPressed: onDetailInbodyButtonPressed,
                text: '인바디 데이터',
              ),
            )
          ],
        ),
      ],
    );
  }
}
