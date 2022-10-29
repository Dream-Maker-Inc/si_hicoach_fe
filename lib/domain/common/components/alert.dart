import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String content;
  final String positiveText;
  final VoidCallback onPositivePressed;
  final String? negativeText;
  final Function? onNegativePressed;

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
        style: TextStyle(
          fontSize: 26,
          color: colorScheme.primary,
        ),
      ),
      content: Text(
        widget.content,
        style: Theme.of(context).textTheme.button,
      ),
      actions: <Widget>[
        if (widget.negativeText?.isNotEmpty ?? false) ...[
          TextButton(
            onPressed: () => widget.onNegativePressed,
            child: Text(
              widget.negativeText!,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colorScheme.secondary),
          ),
          onPressed: widget.onPositivePressed,
          child: Text(widget.positiveText),
        ),
      ],
    );
  }
}
