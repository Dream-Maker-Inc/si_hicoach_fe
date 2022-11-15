import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/studying/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  const StudyingListView({Key? key, required this.list}) : super(key: key);
  final List<MemberProps> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: List.from(
          list.map(
            (it) => StudyingListItemView(
              id: it.id,
              name: it.name,
              currentStudy: it.latestStudyRound,
              regDate: it.matchedDate,
              totalStudy: it.totalStudyCount,
            ),
          ),
        ),
      ).toList(),
    );
  }
}
