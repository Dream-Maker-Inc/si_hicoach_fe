import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/memo/detail.dart';

class MemberMypageMemoListView extends StatelessWidget {
  const MemberMypageMemoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '메모 모아보기'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(
            20,
            (int index) => ListTile(
              title: const Text('2022년 9월 10일'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MemberMypageMemoDetailView(),
                  ),
                );
              },
            ),
          ),
        ).toList(),
      ),
    );
  }
}
