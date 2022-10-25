import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/trainer/main/main.dart';
import 'package:si_hicoach_fe/domain/trainer/member/member_list.dart';

class TrainerBaseView extends StatefulWidget {
  const TrainerBaseView({Key? key}) : super(key: key);

  @override
  State<TrainerBaseView> createState() => _TrainerBaseViewState();
}

class _TrainerBaseViewState extends State<TrainerBaseView> {
  int _currentTabIndex = 0;

  final List _pages = [
    const TrainerHomeView(),
    const TrainerMemberListView(),
    const TrainerMemberListView(),
    const TrainerMemberListView(),
  ];

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "캘린더"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "회원 목록"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "머아페이지"),
      ],
    );
  }

  _onTap(int tabIndex) {
    _pages.map((page) => MaterialPageRoute(builder: (context) => page));
    setState(() => _currentTabIndex = tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
