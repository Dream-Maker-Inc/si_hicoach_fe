import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/member/studying/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  const StudyingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
          StudyingListItemView(),
        ],
      ),
    );
  }
}
