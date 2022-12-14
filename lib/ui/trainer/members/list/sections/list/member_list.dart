import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/models/member_model.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/sections/list/member_list_item.dart';

class MemberListView extends StatelessWidget {
  const MemberListView({Key? key, required this.list}) : super(key: key);
  final List<MemberModel> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const EmptyDataPatch();

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: list
          .map(
            (it) => Column(
              children: [
                MemberListItem(
                  id: it.id,
                  name: it.name,
                  currentStudy: it.latestStudyRound,
                  regDate: it.matchedDate,
                  totalTicketCount: it.totalTicketCount,
                  matchingId: it.matchingId,
                  isTrainer: it.isTrainer,
                ),
                const CustomDivider()
              ],
            ),
          )
          .toList(),
    );
  }
}
