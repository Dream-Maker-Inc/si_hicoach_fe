import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/common/utils/number_format.dart';

class MemberListPopupItem extends StatelessWidget {
  const MemberListPopupItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.regDate,
      required this.currentStudy,
      required this.totalTicketCount,
      required this.onClick})
      : super(key: key);

  final int id;
  final String name;
  final String regDate;
  final int currentStudy;
  final int totalTicketCount;
  final Function(int memberId) onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onClick(id),
        title: Text('$name 회원님'),
        subtitle: Text(
          '등록일자 : $regDate',
          style: bodySmall.copyWith(
            color: Colors.grey.shade500,
          ),
        ),
        trailing: Text(
          '${currentStudy.toKC}회차 (${totalTicketCount.toKC}회)',
          style: bodySmall.copyWith(color: Colors.grey.shade500),
        ));
  }
}
