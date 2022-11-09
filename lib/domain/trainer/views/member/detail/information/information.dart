import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/exercise_purpose.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/memo.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/study_information/study_information.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: const <Widget>[
            StudyInformation(),
            SizedBox(height: widePadding),
            ExercisePurpose(),
            SizedBox(height: widePadding),
            Memo(),
          ],
        ),
      ),
    );
  }
}
