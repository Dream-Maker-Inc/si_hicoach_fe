import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/studying/studying_list.dart';

class MemberListTab extends StatelessWidget {
  const MemberListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              tabs: const <Widget>[
                Tab(text: '수강 중'),
                Tab(text: '수강 완료'),
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
            ),
          ),
          body: const TabBarView(
            children: [StudyingListView(), StudyingListView()],
          ),
        ),
      ),
    );
  }
}
