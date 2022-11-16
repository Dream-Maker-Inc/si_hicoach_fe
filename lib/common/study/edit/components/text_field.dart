import 'package:flutter/material.dart';

class ExerciseTextField extends StatelessWidget {
  const ExerciseTextField({
    super.key,
    required this.suffixText,
    required this.labelText,
    required this.initialValue,
    this.onChanged,
  });

  final String suffixText;
  final String labelText;
  final int initialValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            suffix: Text(suffixText),
            counterText: '',
            labelText: labelText,
          ),
          keyboardType: TextInputType.number,
          maxLength: 3,
          initialValue: initialValue.toString(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
