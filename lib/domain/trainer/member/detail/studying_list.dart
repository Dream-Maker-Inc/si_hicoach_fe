import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/studying_list_item.dart';
import 'package:si_hicoach_fe/domain/trainer/member/studying/studying_list_item.dart';

class TrainerMemberDetailStudyingListView extends StatelessWidget {
  const TrainerMemberDetailStudyingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: List.generate(
          10,
          (int index) => const TrainerMemberStudyingListItemView(),
        ),
      ).toList(),
    );
  }
}
