import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class TrainerMainTodoItem extends StatelessWidget {
  final int time;
  final String name;
  final bool isCompleted;
  final int currentStudy;
  final int totalStudy;

  const TrainerMainTodoItem({
    Key? key,
    required this.time,
    required this.name,
    required this.isCompleted,
    required this.currentStudy,
    required this.totalStudy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    handleItemPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const StudyDetailView(),
        ),
      );
    }

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
                onPressed: handleItemPressed,
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
