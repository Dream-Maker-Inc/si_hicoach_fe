import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/text_field/range_text_input_formatter.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/tickets/tickets_vm.dart';

class EditTicketDialog extends StatelessWidget {
  EditTicketDialog({super.key});

  final TicketsViewModel _vm = Get.find<TicketsViewModel>();

  handleInputChanged(String value) {
    final v = int.tryParse(value) ?? 0;
    _vm.countOfAdd.value = v;
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
          _buildTextField(),
        ],
      ),
    );
  }

  _buildTextField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      hintText: '추가할 PT 횟수',
      maxLength: 3,
      suffixText: '회',
      onChanged: handleInputChanged,
      inputFormatters: [CustomRangeTextInputFormatter(min: 1, max: 999)],
    );
  }
}
