import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() handleButtonPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.handleButtonPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handleButtonPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(text),
    );
  }
}
