import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final String positiveText;
  final VoidCallback onPositivePressed;
  final String? negativeText;
  final Function? onNegativePressed;

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
        style: titleLarge.copyWith(
          color: colorScheme.primary,
        ),
      ),
      content: content,
      actions: <Widget>[
        if (negativeText?.isNotEmpty ?? false) ...[
          TextButton(
            onPressed: () => onNegativePressed,
            child: Text(negativeText!, style: bodySmall),
          ),
        ],
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              colorScheme.secondary,
            ),
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
            style: bodySmall.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
