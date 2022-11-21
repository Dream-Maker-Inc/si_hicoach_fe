import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/study/create/study_create.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/study/studying_list_item.dart';

class StudyingListView extends StatelessWidget {
  StudyingListView({super.key});

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  _onFABPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => StudyCreateView(
            matchingId: _vm.matchingId,
            latestStudyRound: _vm.latestStudy.round,
            totalStudyCount: _vm.latestStudy.totalStudyCount),
      ),
    ).then((_) => _vm.fetchMemberStudies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFABPressed(context),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
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
          .map((it) => StudyingListItemModel(
              studyId: it.id,
              title: '${it.round}회차',
              subtitle: it.startedDate.toKoreanFormat))
          .toList();

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
