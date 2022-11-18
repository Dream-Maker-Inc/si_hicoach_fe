import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/study/detail/detail.dart';

class StudyingListItemModel {
  String title;
  String subtitle;

  StudyingListItemModel({required this.title, required this.subtitle});
}

class StudyingListItemView extends StatelessWidget {
  const StudyingListItemView({super.key, required this.model});

  final StudyingListItemModel model;

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
      title: Text(model.title),
      subtitle: Text(model.subtitle),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
