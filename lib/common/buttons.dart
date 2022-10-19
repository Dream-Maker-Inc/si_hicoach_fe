import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/color_schemes.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        minimumSize: const Size.fromHeight(66),
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
        minimumSize: const Size.fromHeight(66),
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
