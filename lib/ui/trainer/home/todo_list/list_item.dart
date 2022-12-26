import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class TrainerMainTodoItemModel {
  final int studyId;
  final int time;
  final String name;
  final bool isCompleted;
  final int studyCount;
  final int totalTicketCount;

  TrainerMainTodoItemModel({
    required this.studyId,
    required this.time,
    required this.name,
    required this.isCompleted,
    required this.studyCount,
    required this.totalTicketCount,
  });
}

class TrainerMainTodoItem extends StatelessWidget {
  final TrainerMainTodoItemModel model;

  const TrainerMainTodoItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  handleItemPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StudyDetailView(
          studyId: model.studyId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int time = model.time;
    final String name = model.name;
    final bool isCompleted = model.isCompleted;
    final int currentStudy = model.studyCount;
    final int totalStudy = model.totalTicketCount;

    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isCompleted ? Colors.grey.shade200 : primaryColor.withAlpha(20),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: smallPadding,
        bottom: smallPadding,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '$time시',
              style: bodyLarge,
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () => handleItemPressed(context),
                child: ListTile(
                  title: Text(
                    '$name 회원님',
                    style: titleMedium.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  subtitle: Text(
                    '$currentStudy회 진행 · 총 $totalStudy회',
                    style: bodySmall.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}