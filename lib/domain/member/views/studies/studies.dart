import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';

class StudyProps {
  final int index;
  final String timestamp;
  final String type;

  StudyProps(this.index, this.timestamp, this.type);
}

class MemberStudiesView extends StatelessWidget {
  MemberStudiesView({Key? key}) : super(key: key);

  final List<StudyProps> list = [
    StudyProps(1, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", 'PT 수업'),
    StudyProps(2, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", '개인 일정'),
    StudyProps(3, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", 'PT 수업'),
    StudyProps(4, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", '개인 일정'),
    StudyProps(5, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", 'PT 수업'),
    StudyProps(6, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", '개인 일정'),
    StudyProps(7, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", 'PT 수업'),
    StudyProps(8, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", '개인 일정'),
    StudyProps(9, "2022년 10월 28일 오전 11시 ~ 오전 11시 50분", 'PT 수업'),
  ];

  _onItemPressed() {
    print('item pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '운동일지'),
      body: SafeArea(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: List.of(
              list.map(
                (it) => ListTile(
                  title: Text('${it.index}회차 수업'),
                  subtitle: Text(it.timestamp),
                  trailing: Text(it.type),
                  onTap: _onItemPressed,
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
