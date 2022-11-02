import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/inbody/inbody.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/study_information/summary.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/tickets.dart';

class TrainerMemberDetailStudyInformation extends StatelessWidget {
  const TrainerMemberDetailStudyInformation({Key? key}) : super(key: key);

  onDetailTicketButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            const TrainerMemberDetailTicketsView(),
      ),
    );
  }

  onDetailInbodyButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            const TrainerMemberDetailInbodyView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('수업 정보', style: Theme.of(context).textTheme.headline2),
        const TrainerMemberDetailInformationSummary(),
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
                onPressed: () => onDetailInbodyButtonPressed(context),
                text: '인바디 데이터',
              ),
            )
          ],
        ),
      ],
    );
  }
}