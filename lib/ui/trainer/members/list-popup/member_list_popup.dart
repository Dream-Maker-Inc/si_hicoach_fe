import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/common/utils/number_format.dart';
import 'package:si_hicoach_fe/ui/common/study/create/study_create.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list-popup/components/list_item.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list-popup/member_list_popup_vm.dart';

class TrainerMemberListPopup extends StatefulWidget {
  final DateTime targetDateTime;
  final VoidCallback onSuccess;

  const TrainerMemberListPopup(
      {super.key, required this.targetDateTime, required this.onSuccess});

  @override
  TrainerMemberListPopupState createState() => TrainerMemberListPopupState();
}

class TrainerMemberListPopupState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: _buildLayout(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              const CustomDivider(),
              Expanded(child: _buildListView())
            ],
          ),
        ));
  }

  _buildLayout({required Widget child}) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Center(
          child: child,
        ),
      ),
    );
  }

  // 리스트 헤더
  _buildHeader() {
    return Obx(() {
      final totalMemberCount = vm.totalMemberCount;

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("회원 목록", style: headlineSmall),
              Text(
                "수강중 (총 ${totalMemberCount.toKC}명)",
                style: bodyMedium.copyWith(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      );
    });
  }

  // 리스트 렌더링
  _buildListView() {
    return Obx(() {
      final items = vm.inClassMembers;

      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            final item = items[index];

            return Column(children: [
              MemberListPopupItem(
                id: item.member.id,
                name: item.member.name,
                regDate: item.createdAt.toKoreanFormat,
                currentStudy: item.nextStudyRound - 1,
                totalTicketCount: item.totalTicketCount,
                onClick: handleItemClick,
              ),
              const CustomDivider()
            ]);
          });
    });
  }
}

class _Detail extends MyGetXState<TrainerMemberListPopup,
    TrainerMemberListPopupViewModel> {
  _closeThisPopup() {
    Get.back();
  }

  handleItemClick(int memberId) {
    _closeThisPopup();

    final item = vm.findItemByMemberId(memberId);
    if (item == null) return;

    final matchingId = item.id;
    final nextStudyRound = item.nextStudyRound;
    final totalTicketCount = item.totalTicketCount;

    Get.to(
      StudyCreateView(
        matchingId: matchingId,
        nextStudyRound: nextStudyRound,
        totalTicketCount: totalTicketCount,
        targetDateTime: widget.targetDateTime,
      ),
    )?.then((_) => widget.onSuccess());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchInClassMembers();
    });

    return widget;
  }

  @override
  TrainerMemberListPopupViewModel createViewModel() =>
      TrainerMemberListPopupViewModel();
}
