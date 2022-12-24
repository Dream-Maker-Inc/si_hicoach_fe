// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/information/sections/exercise_purpose.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/information/sections/memo.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/information/sections/study_info/study_information.dart';

class Information extends StatefulWidget {
  Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            StudyInformation(),
            const SizedBox(height: widePadding),
            ExercisePurpose(),
            const SizedBox(height: widePadding),
            Memo(),
          ],
        ),
      ),
    );
  }
}
