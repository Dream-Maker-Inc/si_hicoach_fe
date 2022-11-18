import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/study/create/study.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
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

  _onFABPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const StudyEditView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
      ),
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
}
