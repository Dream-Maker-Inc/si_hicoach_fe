import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/number_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/member_list_vm.dart';

class MemberListItem extends StatelessWidget {
  MemberListItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.regDate,
      required this.currentStudy,
      required this.totalTicketCount,
      required this.matchingId})
      : super(key: key);

  final int id;
  final String name;
  final String regDate;
  final int currentStudy;
  final int totalTicketCount;
  final int matchingId;

  final TrainerMemberListViewModel _vm = Get.find<TrainerMemberListViewModel>();

  handleDetailButtonPressed(BuildContext context) {
    Get.to(DetailView(memberId: id))?.then((_) => _vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => handleDetailButtonPressed(context),
      title: Text('$name 회원님'),
      subtitle: Text(
        '등록일자 : $regDate',
        style: bodySmall.copyWith(
          color: Colors.grey.shade500,
        ),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '${currentStudy.toKC}회차 (${totalTicketCount.toKC}회)',
              style: bodySmall.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            IconButton(
              onPressed: () => handleDetailButtonPressed(context),
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
