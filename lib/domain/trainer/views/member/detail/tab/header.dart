import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerMemberDetailHeader extends StatelessWidget {
  const TrainerMemberDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const <Widget>[
        Tab(text: '회원 정보', height: 54),
        Tab(text: '운동 일지'),
      ],
      labelColor: colorScheme.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    );
  }
}
