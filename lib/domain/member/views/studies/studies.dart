import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/study.dart';

class StudyProps {
  final int index;
  final String timestamp;
  final String type;

  StudyProps(this.index, this.timestamp, this.type);
}

class MemberStudiesView extends StatelessWidget {
  MemberStudiesView({Key? key}) : super(key: key);

  final List<StudyProps> list = [
    StudyProps(1, "2022. 10. 28. 11:00 ~ 11:50", 'PT 수업'),
    StudyProps(2, "2022. 10. 28. 11:00 ~ 11:50", '개인 일정'),
    StudyProps(3, "2022. 10. 28. 11:00 ~ 11:50", 'PT 수업'),
    StudyProps(4, "2022. 10. 28. 11:00 ~ 11:50", '개인 일정'),
    StudyProps(5, "2022. 10. 28. 11:00 ~ 11:50", 'PT 수업'),
    StudyProps(6, "2022. 10. 28. 11:00 ~ 11:50", '개인 일정'),
    StudyProps(7, "2022. 10. 28. 11:00 ~ 11:50", 'PT 수업'),
    StudyProps(8, "2022. 10. 28. 11:00 ~ 11:50", '개인 일정'),
    StudyProps(9, "2022. 10. 28. 11:00 ~ 11:50", 'PT 수업'),
  ];

  @override
  Widget build(BuildContext context) {
    handleAddButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => StudyEditView(),
        ),
      );
    }

    onItemPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const StudyDetailView(
            isMemberDetailEnabled: false,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBarWithLogo(titleText: '운동일지', actionsWidget: <Widget>[
        IconButton(
          onPressed: handleAddButtonPressed,
          icon: const Icon(Icons.add_rounded),
        ),
      ]),
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
                  onTap: onItemPressed,
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
