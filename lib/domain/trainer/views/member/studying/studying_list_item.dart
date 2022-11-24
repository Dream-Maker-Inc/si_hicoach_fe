import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list_vm.dart';

class StudyingListItemView extends StatelessWidget {
  StudyingListItemView({
    Key? key,
    required this.id,
    required this.name,
    required this.regDate,
    required this.currentStudy,
    required this.totalStudy,
  }) : super(key: key);

  final int id;
  final String name;
  final String regDate;
  final int currentStudy;
  final int totalStudy;

  final MemberListViewModel _vm = Get.find<MemberListViewModel>();

  handleDetailButtonPressed(BuildContext context) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DetailView(memberId: id),
          ),
        )
        .then((value) => _vm.refetch());
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
              '$currentStudy회차 ($totalStudy회)',
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
