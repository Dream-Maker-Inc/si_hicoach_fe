import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

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
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
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
          color: primaryColor,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
