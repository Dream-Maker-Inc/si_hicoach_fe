import 'package:flutter/services.dart';

class CustomRangeTextInputFormatter extends TextInputFormatter {
  int min;
  int max;

  CustomRangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    }

    if (int.parse(newValue.text) < min) {
      return const TextEditingValue().copyWith(text: min.toString());
    }

    return int.parse(newValue.text) > max
        ? const TextEditingValue().copyWith(text: max.toString())
        : newValue;
  }
}
