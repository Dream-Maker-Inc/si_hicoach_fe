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
  bool _isAgreementChecked = false;

  _handleCheckBoxChanged(value) {
    setState(() => _isAgreementChecked = value!);
  }

  _handleTapAgreementDetail() {
    setState(() => _isAgreementChecked = !_isAgreementChecked);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          color: _isAgreementChecked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary,
          fontSize: 16,
        ),
      ),
      leading: Checkbox(
        value: _isAgreementChecked,
        onChanged: (value) => _handleCheckBoxChanged(value),
        activeColor: Colors.transparent,
        checkColor: colorScheme.primary,
        fillColor: MaterialStateProperty.all(Colors.transparent),
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
