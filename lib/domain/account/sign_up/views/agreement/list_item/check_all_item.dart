import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class ItemModel {
  final Function() onPressed;

  ItemModel({required this.onPressed});
}

class CheckAllItem extends StatefulWidget {
  final void Function() onPressed;

  const CheckAllItem({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CheckAllItem> createState() => _CheckAllItemState();
}

class _CheckAllItemState extends State<CheckAllItem> {
  _handleTapCheckAll() {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: primaryColor,
        ),
      ),
      title: Text(
        '모든 약관에 동의합니다.',
        style: TextStyle(
          color: primaryColor,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: true,
        activeColor: Colors.transparent,
        checkColor: primaryColor,
        onChanged: (bool? value) {},
      ),
      onTap: _handleTapCheckAll,
    );
  }
}
