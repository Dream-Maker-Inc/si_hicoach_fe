import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String content;
  final String positiveText;
  final VoidCallback onPositivePressed;
  final String? negativeText;
  final VoidCallback? onNegativePressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.positiveText,
    required this.onPositivePressed,
    this.negativeText,
    this.onNegativePressed,
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: titleLarge.copyWith(color: primaryColor),
      ),
      content: Text(
        widget.content,
        style: bodyMedium,
      ),
      actions: <Widget>[
        if (widget.negativeText?.isNotEmpty ?? false) ...[
          TextButton(
            onPressed: widget.onNegativePressed,
            child: Text(
              widget.negativeText!,
              style: bodySmall,
            ),
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
          onPressed: widget.onPositivePressed,
          child: Text(
            widget.positiveText,
            style: bodySmall.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}
