import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/chip.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: TitleWithDescription(
                title: '운동 목표',
                description: '회원 등록 시 선택하신 운동 목표입니다.',
              ),
            ),
            IconButton(
              onPressed: onEditIconPressed,
              icon: const Icon(
                Icons.edit_sharp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Wrap(
          children: List.from(
            purpose.map(
              (text) => CustomChip(
                label: text,
                isChecked: false,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
