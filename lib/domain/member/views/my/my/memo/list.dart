import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/memo/detail.dart';

class MemoProps {
  final String title;
  final String content;

  MemoProps(this.title, this.content);
}

class MemoListView extends StatelessWidget {
  MemoListView({Key? key}) : super(key: key);

  final List<MemoProps> list = [
    MemoProps('2022년 9월 1일', '오늘의 메모!'),
    MemoProps('2022년 9월 2일', '오늘의 메모!'),
    MemoProps('2022년 9월 3일', '오늘의 메모!'),
    MemoProps('2022년 9월 4일', '오늘의 메모!'),
    MemoProps('2022년 9월 5일', '오늘의 메모!'),
    MemoProps('2022년 9월 6일', '오늘의 메모!'),
    MemoProps('2022년 9월 7일', '오늘의 메모!'),
    MemoProps('2022년 9월 8일', '오늘의 메모!'),
    MemoProps('2022년 9월 9일', '오늘의 메모!'),
    MemoProps('2022년 9월 10일', '오늘의 메모!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '메모 모아보기'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            list.map(
              (it) => ListTile(
                title: Text(it.title),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MemoDetailView(),
                    ),
                  );
                },
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
