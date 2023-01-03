import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class TermListItemModel {
  final int id;
  final String title;
  final bool isChecked;

  TermListItemModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });
}

class TermListItem extends StatefulWidget {
  final TermListItemModel model;

  final void Function(int id) onClick;
  final void Function(int id) onChecked;
  final void Function(int id) onIconClick;

  const TermListItem({
    Key? key,
    required this.model,
    required this.onClick,
    required this.onChecked,
    required this.onIconClick,
  }) : super(key: key);

  @override
  State<TermListItem> createState() => _TermListItemState();
}

class _TermListItemState extends State<TermListItem> {
  TermListItemModel get model => widget.model;

  _handleIconClick() {
    widget.onIconClick(model.id);
  }

  _handleCheckBoxChanged(bool? value) {
    widget.onChecked(model.id);
  }

  _handleTapAgreementDetail() {
    widget.onClick(model.id);
  }

  @override
  Widget build(BuildContext context) {
    var colorState = model.isChecked
        ? primaryColor.withOpacity(0.8)
        : Colors.grey.shade500.withOpacity(0.8);

    return ListTile(
      title: Text(
        model.title,
        style: TextStyle(
          color: colorState,
          fontSize: 14,
        ),
      ),
      leading: Checkbox(
        value: true,
        onChanged: _handleCheckBoxChanged,
        activeColor: Colors.transparent,
        checkColor: colorState,
      ),
      trailing: IconButton(
        onPressed: _handleIconClick,
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: colorState,
        ),
      ),
      onTap: _handleTapAgreementDetail,
    );
  }
}
