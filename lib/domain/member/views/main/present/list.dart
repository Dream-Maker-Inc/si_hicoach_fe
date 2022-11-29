import 'package:flutter/material.dart';

class ExerciseProps {
  final int count;
  final String date;

  ExerciseProps(this.count, this.date);
}

class PresentListView extends StatelessWidget {
  PresentListView({super.key});

  final List<ExerciseProps> list = [
    ExerciseProps(5, '2022년 10월 10일 오전 11시 ~ 오전 11시 50분'),
    ExerciseProps(4, '2022년 10월 10일 오전 11시 ~ 오전 11시 50분'),
    ExerciseProps(3, '2022년 10월 10일 오전 11시 ~ 오전 11시 50분'),
    ExerciseProps(2, '2022년 10월 10일 오전 11시 ~ 오전 11시 50분'),
    ExerciseProps(1, '2022년 10월 10일 오전 11시 ~ 오전 11시 50분'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

        return Column(children: [
          ListTile(
            title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('${item.count}회차 수업')),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.date),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider()
        ]);
      },
    );
    ;
  }
}
