import 'package:flutter/material.dart';

class AgreementListItem extends StatefulWidget {
  final String text;

  const AgreementListItem({Key? key, required this.text}) : super(key: key);

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
        widget.text,
        style: TextStyle(
          color: _isAgreementChecked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onTertiary,
          fontSize: 18,
        ),
      ),
      leading: Checkbox(
        value: _isAgreementChecked,
        onChanged: (value) => _handleCheckBoxChanged(value),
        activeColor: Colors.indigo,
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
