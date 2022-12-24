// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/edit/purpose.dart';

class ExercisePurpose extends StatefulWidget {
  ExercisePurpose({super.key});

  @override
  State<ExercisePurpose> createState() => _ExercisePurposeState();
}

class _ExercisePurposeState extends State<ExercisePurpose> {
  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  onEditIconPressed(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PurposeEditView(matchingId: _vm.matchingId),
      ),
    ).then((value) => _vm.refetch());
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
