import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/trainer/member/edit/purpose.dart';

class TrainerMemberDetailExercisePurpose extends StatefulWidget {
  const TrainerMemberDetailExercisePurpose({Key? key}) : super(key: key);

  @override
  State<TrainerMemberDetailExercisePurpose> createState() =>
      _TrainerMemberDetailExercisePurposeState();
}

class _TrainerMemberDetailExercisePurposeState
    extends State<TrainerMemberDetailExercisePurpose> {
  List<String> purpose = ['다이어트', '체형교정', '근력증가', '건강관리', '기초체력향상', '스트레스해소'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              '운동 목표',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const TrainerMemberEditView(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(70, 103, 240, 0.1),
                ),
              ),
              icon: Icon(Icons.edit_sharp, color: colorScheme.primary),
            ),
          ],
        ),
        Wrap(
          children: <Widget>[
            ...purpose.map(
              (text) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(70, 103, 240, 0.1),
                ),
                margin: const EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 12,
                    right: 12,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: colorScheme.primary, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
