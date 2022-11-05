import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/member/views/main/main.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/my.dart';
import 'package:si_hicoach_fe/domain/member/views/studies/studies.dart';

class MemberBaseView extends StatefulWidget {
  const MemberBaseView({Key? key}) : super(key: key);

  @override
  State<MemberBaseView> createState() => _TrainerBaseViewState();
}

class _TrainerBaseViewState extends State<MemberBaseView> {
  int _currentTabIndex = 0;

  final List _pages = [
    const MemberMainView(),
    MemberStudiesView(),
    MemberStudiesView(),
    const MypageView(),
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
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "운동 일지"),
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
