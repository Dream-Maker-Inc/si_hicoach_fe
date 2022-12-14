import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';

class StudyingListItemModel {
  int studyId;
  String title;
  String subtitle;

  StudyingListItemModel({
    required this.studyId,
    required this.title,
    required this.subtitle,
  });
}

class StudyingListItemView extends StatelessWidget {
  StudyingListItemView({super.key, required this.model});

  final StudyingListItemModel model;
  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  _handleItemClick(BuildContext ctx) {
    Get.to(
      StudyDetailView(
        studyId: model.studyId,
        isMemberDetailEnabled: false,
      ),
    )?.then((_) => _vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _handleItemClick(context),
      title: Text(model.title),
      subtitle: Text(model.subtitle),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
