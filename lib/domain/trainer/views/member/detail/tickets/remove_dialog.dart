import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/text_field/range_text_input_formatter.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/tickets_vm.dart';

class RemoveTicketDialog extends StatelessWidget {
  RemoveTicketDialog({Key? key}) : super(key: key);

  final TicketsViewModel _vm = Get.find<TicketsViewModel>();

  handleInputChanged(String value) {
    final v = int.tryParse(value) ?? 0;
    _vm.countOfMinus.value = v;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('차감할 PT 횟수를 입력하세요.', style: bodyMedium),
          const SizedBox(height: defaultPadding),
          _buildTextField()
        ],
      ),
    );
  }

  _buildTextField() {
    return Obx(() {
      return CustomTextField(
        keyboardType: TextInputType.number,
        hintText: '차감할 PT 횟수',
        maxLength: 3,
        suffixText: '회',
        onChanged: handleInputChanged,
        inputFormatters: [
          CustomRangeTextInputFormatter(min: 1, max: _vm.remainingTicketCount)
        ],
      );
    });
  }
}
