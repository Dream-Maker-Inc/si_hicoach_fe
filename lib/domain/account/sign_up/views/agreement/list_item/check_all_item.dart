import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class CheckAllItem extends StatefulWidget {
  final void Function() onPressed;
  final bool isChecked;

  const CheckAllItem({
    Key? key,
    required this.isChecked,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CheckAllItem> createState() => _CheckAllItemState();
}

class _CheckAllItemState extends State<CheckAllItem> {
  _handleTapCheckAll() {
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final isChecked = widget.isChecked;

    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: primaryColor,
        ),
      ),
      title: Text(
        '모든 약관에 동의합니다.',
        style: TextStyle(
          color: isChecked ? primaryColor : Colors.grey,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: isChecked,
        activeColor: Colors.transparent,
        checkColor: primaryColor,
        onChanged: (_) {},
      ),
      onTap: _handleTapCheckAll,
    );
  }
}
