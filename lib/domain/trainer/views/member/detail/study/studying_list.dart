import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/study/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  StudyingListView({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  List<StudyingListItemModel> get models => _vm.memberStudies
      .map((it) => StudyingListItemModel(
          title: '${it.round}회차', subtitle: it.startedDate.toKoreanFormat))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: models.map((it) => StudyingListItemView(
              model: it,
            )),
      ).toList(),
    );
  }
}
