import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class EditTicketDialog extends StatefulWidget {
  const EditTicketDialog({Key? key}) : super(key: key);

  @override
  State<EditTicketDialog> createState() => _EditTicketDialogState();
}

class _EditTicketDialogState extends State<EditTicketDialog> {
  final TextEditingController inputController = TextEditingController();

  _validateInput(int value) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('추가할 PT 횟수를 입력하세요.', style: TextStyle(fontSize: 20)),
          const SizedBox(height: defaultPadding),
          Form(
            child: CustomTextField(
              keyboardType: TextInputType.number,
              hintText: '추가할 PT 횟수',
              maxLength: 3,
              suffixText: '회',
              controller: inputController,
              validator: (value) => _validateInput(value),
            ),
          ),
        ],
      ),
    );
  }
}
