import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/studying/studying_list.dart';

class MemberListTab extends StatelessWidget {
  const MemberListTab({Key? key, required this.list}) : super(key: key);
  final List<MemberProps> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: TabBar(
                tabs: const <Widget>[
                  Tab(text: '수강 중'),
                  Tab(text: '수강 완료'),
                ],
                labelColor: colorScheme.primary,
                unselectedLabelColor: Colors.black87,
                labelStyle: labelLarge,
                unselectedLabelStyle: labelLarge.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: CustomDivider(),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              StudyingListView(list: list),
              StudyingListView(list: list),
            ],
          ),
        ),
      ),
    );
  }
}
