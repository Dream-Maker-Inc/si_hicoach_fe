import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/calendar/weekly/calendar.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/main.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/my.dart';

class TrainerBaseView extends StatefulWidget {
  const TrainerBaseView({Key? key}) : super(key: key);

  @override
  State<TrainerBaseView> createState() => _TrainerBaseViewState();
}

class _TrainerBaseViewState extends State<TrainerBaseView> {
  int _currentTabIndex = 0;

  final List _pages = [
    TrainerMainView(),
    const WeeklyCalendarView(),
    MemberListView(),
    const MypageView(),
  ];

  final _bottomNavigationBarItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "캘린더"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "회원 목록"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "머아페이지"),
  ];

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      items: _bottomNavigationBarItems,
    );
  }

  _onTap(int tabIndex) {
    _pages.map(
      (page) => MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
    setState(() => _currentTabIndex = tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CustomDivider(),
          _bottomNavigationBar(),
        ],
      ),
    );
  }
}
