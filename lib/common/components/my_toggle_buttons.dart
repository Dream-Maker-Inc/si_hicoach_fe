import 'package:flutter/material.dart';

class MyToggleButtons extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Function(int)? onPressed;
  final Color? selectedBorderColor;
  final Color? color;
  final double width;
  final double height;
  final List<Widget> children;
  final List<bool> isSelected;

  const MyToggleButtons(
      {super.key,
      this.borderRadius,
      this.onPressed,
      this.selectedBorderColor,
      this.color,
      this.width = double.infinity,
      this.height = 40,
      required this.children,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: LayoutBuilder(builder: (ctx, constraints) {
          final minWidth = constraints.minWidth / 2.02;

          return ToggleButtons(
              constraints: BoxConstraints(
                minWidth: minWidth,
                minHeight: constraints.minHeight,
              ),
              borderRadius: borderRadius,
              onPressed: onPressed,
              selectedBorderColor: selectedBorderColor,
              color: color,
              isSelected: isSelected,
              children: children);
        }));
  }
}
