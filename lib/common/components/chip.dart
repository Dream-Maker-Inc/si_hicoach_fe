import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class CustomChipProps {
  final int id;
  final String label;
  bool isChecked;

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
        isChecked ? primaryColor : colorScheme.onPrimary,
      ),
    );
  }

  TextStyle _buildTitleStyle() {
    return TextStyle(color: isChecked ? Colors.white : primaryColor);
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
