// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/edit/purpose.dart';

class ExercisePurpose extends StatefulWidget {
  ExercisePurpose({super.key});

  @override
  State<ExercisePurpose> createState() => _ExercisePurposeState();
}

class _ExercisePurposeState extends State<ExercisePurpose> {
  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  List<String> purpose = ['다이어트', '체형교정', '근력증가', '건강관리', '기초체력향상', '스트레스해소'];

  onEditIconPressed(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PurposeEditView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final goals = _vm.exerciseGoals;

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
              onPressed: () => onEditIconPressed(context),
              icon: const Icon(
                Icons.edit_sharp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Wrap(
          children: List.from(
            goals.map(
              (it) => CustomChip(
                label: it.title,
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
