import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/calendar/monthly/calendar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/member/views/main/main.dart';
import 'package:si_hicoach_fe/ui/member/studies/studies.dart';
import 'package:si_hicoach_fe/ui/member/my_page/main/my_page_view.dart';

class MemberBaseView extends StatefulWidget {
  const MemberBaseView({Key? key}) : super(key: key);

  @override
  State<MemberBaseView> createState() => _TrainerBaseViewState();
}

class _TrainerBaseViewState extends State<MemberBaseView> {
  int _currentTabIndex = 0;

  final List _pages = [
    const MemberMainView(),
    const MonthlyCalendarView(isBackButtonEnabled: false),
    const MemberStudiesView(),
    const MemberMypageView(),
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
