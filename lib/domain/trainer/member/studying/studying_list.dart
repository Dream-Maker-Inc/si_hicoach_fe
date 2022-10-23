import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/member/studying/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  const StudyingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: <Widget>[
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
          const StudyingListItemView(),
        ],
      ).toList(),
    );
  }
}
