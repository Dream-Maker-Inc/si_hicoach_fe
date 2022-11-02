import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/detail.dart';

class MemberStudiesView extends StatelessWidget {
  const MemberStudiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onItemPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const StudyDetailView()),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '운동일지'),
      body: SafeArea(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              10,
              (int index) => ListTile(
                title: Text(
                  '$index회차 수업',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: const Text('2022년 10월 5일 오전 11시 ~ 오전 11시 50분'),
                trailing: const Text('PT 수업'),
                onTap: onItemPressed,
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
