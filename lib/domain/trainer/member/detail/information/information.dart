import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/information/exercise_purpose.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/information/memo.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/information/study_information.dart';

class TrainerMemberDetailInformation extends StatelessWidget {
  const TrainerMemberDetailInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: const <Widget>[
            TrainerMemberDetailStudyInformation(),
            SizedBox(height: defaultPadding),
            TrainerMemberDetailExercisePurpose(),
            SizedBox(height: defaultPadding),
            TrainerMemberDetailMemo()
          ],
        ),
      ),
    );
  }
}
