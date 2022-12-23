import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/member/views/studies/studies_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/ui/common/study/create/study_create.dart';

class MemberStudiesView extends StatefulWidget {
  const MemberStudiesView({Key? key}) : super(key: key);

  @override
  State<MemberStudiesView> createState() => _MemberStudiesViewState();
}

class _MemberStudiesViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarWithLogo(titleText: '운동일지', actionsWidget: <Widget>[
        IconButton(
          onPressed: handleAddButtonPressed,
          icon: const Icon(Icons.add_rounded),
        ),
      ]),
      body: SafeArea(child: _buildListView()),
    );
  }

  _buildListView() {
    return Obx(() {
      final items = vm.studyModels;

      return items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

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
                    trailing: Text(item.exerciseTypeLabel),
                    onTap: () => onItemPressed(item.id, item.isPersonal),
                  ),
                  const Divider()
                ]);
              },
            )
          : const EmptyDataPatch();
    });
  }
}

class _Detail extends MyGetXState<MemberStudiesView, MemberMyStudiesViewModel> {
  handleAddButtonPressed() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (BuildContext context) => StudyCreateView(
                matchingId: vm.matchingId,
                nextStudyRound: vm.nextStudyRound,
                totalTicketCount: vm.totalTicketCount),
          ),
        )
        .then((value) => vm.refetch());
  }

  onItemPressed(int studyId, bool isPersonal) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (BuildContext context) => StudyDetailView(
              studyId: studyId,
              readonly: !isPersonal,
              isMemberDetailEnabled: false,
            ),
          ),
        )
        .then((value) => vm.refetch());
  }

  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          onConfirm: () {
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchData()]);
    });

    return widget;
  }

  @override
  MemberMyStudiesViewModel createViewModel() => MemberMyStudiesViewModel();
}
