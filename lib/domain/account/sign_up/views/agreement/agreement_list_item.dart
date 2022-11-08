import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class AgreementListItem extends StatefulWidget {
  final String title;
  final String? content;
  final bool? isRequired;

  const AgreementListItem({
    Key? key,
    required this.title,
    this.content,
    this.isRequired,
  }) : super(key: key);

  @override
  State<AgreementListItem> createState() => _AgreementListItemState();
}

class _AgreementListItemState extends State<AgreementListItem> {
  void _handleCheckBoxChanged(bool? value) {
    print('checkbox changed : $value');
  }

  _handleTapAgreementDetail() {
    print('detail');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: true,
        onChanged: _handleCheckBoxChanged,
        activeColor: Colors.transparent,
        checkColor: colorScheme.primary,
      ),
      trailing: const IconButton(
        onPressed: _handleDropdownPressed,
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
      ),
      onTap: _handleTapAgreementDetail,
    );
  }
}

void _handleDropdownPressed() {}
