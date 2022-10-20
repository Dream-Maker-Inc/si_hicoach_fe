import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class TrainerBottomNavigationBar extends StatelessWidget {
  const TrainerBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "캘린더",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "회원 목록",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "머아페이지",
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: Colors.grey,
    );
  }
}
