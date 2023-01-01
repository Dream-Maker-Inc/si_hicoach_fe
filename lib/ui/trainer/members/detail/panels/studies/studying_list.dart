import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/ui/common/study/create/study_create.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/studies/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  StudyingListView({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  _onFABPressed() {
    Get.to(
      StudyCreateView(
        matchingId: _vm.matchingId,
        nextStudyRound: _vm.nextStudyRound,
        totalTicketCount: _vm.latestStudy.totalStudyCount,
      ),
    )?.then((_) => _vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFABPressed,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
        ),
        child: Icon(
          Icons.edit_rounded,
          color: primaryColor,
        ),
      ),
    );
  }

  _buildListView(BuildContext context) {
    return Obx(() {
      List<StudyingListItemModel> models = _vm.memberStudies
          .map(
            (it) => StudyingListItemModel(
              studyId: it.id,
              title: '${it.round}회차',
              subtitle: it.startedAt.toKoreanFormat,
            ),
          )
          .toList();

      if (models.isEmpty) return const EmptyDataPatch();

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: models.map(
            (it) => StudyingListItemView(
              model: it,
            ),
          ),
        ).toList(),
      );
    });
  }
}
