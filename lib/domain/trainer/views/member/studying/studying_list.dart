import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/studying/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  const StudyingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: List.generate(
          10,
          (int index) => const StudyingListItemView(),
        ),
      ).toList(),
    );
  }
}
