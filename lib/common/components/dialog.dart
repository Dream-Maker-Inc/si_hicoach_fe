import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';

showSimpleDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  final mySimpleDialog = SimpleDialog(
    title: Text(title),
    children: [
      Container(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Text(content),
      )
    ],
  );

  return Navigator.of(
    context,
    rootNavigator: true,
  ).push(
    DialogRoute(
      context: context,
      builder: (context) => mySimpleDialog,
    ),
  );
}
