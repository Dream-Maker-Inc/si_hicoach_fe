import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/domain/member/views/main/main_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/main/present/models/study_item_model.dart';
import 'package:si_hicoach_fe/domain/study/detail/detail.dart';

class PresentListView extends StatefulWidget {
  final List<StudyItemModel> models;

  const PresentListView({super.key, required this.models});

  @override
  State<PresentListView> createState() => _PresentListViewState();
}

class _PresentListViewState extends State<PresentListView> {
  MainPageViewModel vm = Get.find<MainPageViewModel>();

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

    return models.isNotEmpty
        ? ListView.builder(
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
          )
        : const EmptyDataPatch();
  }
}
