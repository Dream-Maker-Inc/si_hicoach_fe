import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class EditTicketDialog extends StatelessWidget {
  const EditTicketDialog({Key? key}) : super(key: key);

  handleInputChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('추가할 PT 횟수를 입력하세요.', style: bodyMedium),
          const SizedBox(height: defaultPadding),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: '추가할 PT 횟수',
            maxLength: 3,
            suffixText: '회',
            onChanged: handleInputChanged,
          ),
        ],
      ),
    );
  }
}
