import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list.dart';

class MemberListTitle extends StatelessWidget {
  const MemberListTitle({Key? key, required this.totalCount}) : super(key: key);
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: defaultPadding,
      ),
      child: TitleWithDescription(
        title: '회원 목록',
        description: '총 ${totalCount}명',
      ),
    );
  }
}
