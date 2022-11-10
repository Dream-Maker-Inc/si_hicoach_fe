import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TermListItemModel {
  final int id;
  final String title;
  final bool isChecked;

  TermListItemModel(
      {required this.id, required this.title, required this.isChecked});
}

class TermListItem extends StatefulWidget {
  final TermListItemModel model;

  final void Function(int id) onClick;
  final void Function(int id) onChecked;

  const TermListItem({
    Key? key,
    required this.model,
    required this.onClick,
    required this.onChecked,
  }) : super(key: key);

  @override
  State<TermListItem> createState() => _TermListItemState();
}

class _TermListItemState extends State<TermListItem> {

  TermListItemModel get model => widget.model;


  _handleCheckBoxChanged(bool? value) {
    widget.onChecked(model.id);
  }

  _handleTapAgreementDetail() {
    widget.onClick(model.id);
  }

  @override
  Widget build(BuildContext context) {
    var colorState = model.isChecked ? colorScheme.primary : Colors.grey;

    return ListTile(
      title: Text(
        model.title,
        style: TextStyle(
          color: colorState,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: true,
        onChanged: _handleCheckBoxChanged,
        activeColor: Colors.transparent,
        checkColor: colorState,
      ),
      trailing: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
      ),
      onTap: _handleTapAgreementDetail,
    );
  }
}
