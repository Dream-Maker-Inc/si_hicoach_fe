import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/detail.dart';

class MemberStudiesView extends StatelessWidget {
  const MemberStudiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithLogo(
        titleText: '운동일지',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              10,
              (int index) => ListTile(
                title: const Text('6회차 수업'),
                subtitle: const Text('2022년 10월 5일 오전 11시 ~ 오전 11시 50분'),
                trailing: const Text('PT 수업'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const StudyDetailView(),
                    ),
                  );
                },
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
