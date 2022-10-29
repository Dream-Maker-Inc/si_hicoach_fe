import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;

  const CustomCheckbox({Key? key, required this.label}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: smallPadding),
      child: ElevatedButton(
        onPressed: () {
          setState(() => isChecked = !isChecked);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isChecked ? colorScheme.primary : colorScheme.secondary,
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: isChecked ? Colors.white : colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
