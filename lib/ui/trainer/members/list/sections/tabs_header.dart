import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';

class MemberListHeader extends StatelessWidget {
  const MemberListHeader({super.key, required this.totalCount});
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
        description: '총 $totalCount명',
      ),
    );
  }
}
