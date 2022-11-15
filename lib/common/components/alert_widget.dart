import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final String positiveText;
  final VoidCallback onPositivePressed;
  final String? negativeText;
  final VoidCallback? onNegativePressed;

  const CustomAlertDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.positiveText,
    required this.onPositivePressed,
    this.negativeText,
    this.onNegativePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: titleLarge.copyWith(color: primaryColor),
      ),
      content: content,
      actions: <Widget>[
        if (negativeText?.isNotEmpty ?? false) ...[
          TextButton(
            onPressed: onNegativePressed,
            child: Text(negativeText!, style: bodySmall),
          ),
        ],
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(secondaryColor),
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
              ),
            ),
          ),
          onPressed: onPositivePressed,
          child: Text(
            positiveText,
            style: bodySmall.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
