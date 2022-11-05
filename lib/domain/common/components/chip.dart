import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class CustomChipProps {
  final int id;
  final String label;
  final bool isChecked;

  CustomChipProps(this.id, this.label, this.isChecked);
}

class CustomChip extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function() onPressed;

  const CustomChip({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.onPressed,
  }) : super(key: key);

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isChecked ? colorScheme.primary : colorScheme.secondary,
      ),
    );
  }

  TextStyle _buildTitleStyle() {
    return TextStyle(
      color: isChecked ? Colors.white : colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: smallPadding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buildButtonStyle(),
        child: Text(label, style: _buildTitleStyle()),
      ),
    );
  }
}
