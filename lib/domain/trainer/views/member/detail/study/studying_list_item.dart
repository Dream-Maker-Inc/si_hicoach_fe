import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/study/detail/detail.dart';

class StudyingListItemView extends StatelessWidget {
  const StudyingListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StudyDetailView(
              isMemberDetailEnabled: false,
            ),
          ),
        );
      },
      title: const Text('9회차'),
      subtitle: const Text('2022년 8월 23일'),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
