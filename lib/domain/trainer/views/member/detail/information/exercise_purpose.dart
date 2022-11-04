import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/edit/purpose.dart';

class ExercisePurpose extends StatefulWidget {
  const ExercisePurpose({Key? key}) : super(key: key);

  @override
  State<ExercisePurpose> createState() => _ExercisePurposeState();
}

class _ExercisePurposeState extends State<ExercisePurpose> {
  List<String> purpose = ['다이어트', '체형교정', '근력증가', '건강관리', '기초체력향상', '스트레스해소'];

  onEditIconPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PurposeEditView(),
      ),
    );
  }

  Widget chip(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.secondary,
      ),
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
        child: Text(
          text,
          style: TextStyle(color: colorScheme.primary, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('운동 목표', style: Theme.of(context).textTheme.headline2),
            IconButton(
              onPressed: onEditIconPressed,
              icon: const Icon(Icons.edit_sharp, color: Colors.grey),
            ),
          ],
        ),
        Wrap(
          children: List.from(purpose.map((text) => chip(text))),
        ),
      ],
    );
  }
}
