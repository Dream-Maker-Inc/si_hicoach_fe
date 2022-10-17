import 'package:flutter/material.dart';

class AgreementListItem extends StatefulWidget {
  final String text;

  const AgreementListItem({Key? key, required this.text}) : super(key: key);

  @override
  State<AgreementListItem> createState() => _AgreementListItemState();
}

class _AgreementListItemState extends State<AgreementListItem> {
  bool _isAgreementChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: TextStyle(
          color: _isAgreementChecked ? Colors.indigo : Colors.black,
        ),
      ),
      leading: Checkbox(
        value: _isAgreementChecked,
        onChanged: (value) {
          setState(() {
            _isAgreementChecked = value!;
          });
        },
        activeColor: Colors.indigo,
      ),
      trailing: const IconButton(
        onPressed: _handleDropdownPressed,
        icon: Icon(Icons.keyboard_arrow_right),
      ),
      onTap: () {
        setState(() {
          _isAgreementChecked = !_isAgreementChecked;
        });
      },
    );
  }
}

void _handleDropdownPressed() {}
