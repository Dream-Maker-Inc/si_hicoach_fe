import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';

showSimpleDialog(
    {required BuildContext context,
    required String title,
    required String content,
    Function()? onConfirm}) {
  final mySimpleDialog = SimpleDialog(
    title: Text(title),
    children: [
      Container(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(content),
            if (onConfirm != null)
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => onConfirm(), child: const Text("확인"))
                    ],
                  ))
          ],
        ),
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
