import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const <Widget>[
        Tab(text: '회원 정보', height: 54),
        Tab(text: '운동 일지'),
      ],
      labelColor: primaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: labelLarge,
      unselectedLabelStyle: labelLarge.copyWith(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
