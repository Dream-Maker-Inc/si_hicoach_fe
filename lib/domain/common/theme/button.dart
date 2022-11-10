import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(text),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          width: 1,
          color: colorScheme.primary,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
