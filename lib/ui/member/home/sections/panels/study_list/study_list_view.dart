import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/ui/member/home/main_vm.dart';
import 'package:si_hicoach_fe/ui/member/home/sections/panels/study_list/models/study_list_item_model.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';

class MainStudyListView extends StatefulWidget {
  final List<StudyItemModel> models;

  const MainStudyListView({super.key, required this.models});

  @override
  State<MainStudyListView> createState() => _MainStudyListViewState();
}

class _MainStudyListViewState extends State<MainStudyListView> {
  MemberMainViewModel vm = Get.find<MemberMainViewModel>();

  handleItemClick(int studyId) {
    Get.to(StudyDetailView(
      studyId: studyId,
      readonly: true,
      isMemberDetailEnabled: false,
    ))?.then((value) => vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    final models = widget.models;

    if (models.isEmpty) return const EmptyDataPatch();

    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, index) {
        final item = models[index];

        return Column(children: [
          ListTile(
            title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('${item.round}회차 수업')),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.startedDateFormat),
                  Text(item.runningTimeFormatString)
                ],
              ),
            ),
            onTap: () => handleItemClick(item.id),
          ),
          const Divider()
        ]);
      },
    );
  }
}
