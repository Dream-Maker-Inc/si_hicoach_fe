import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final String? suffixText;
  final Widget? suffix;
  final int? maxLength;
  final bool? enabled;
  final bool? isPassword;
  final ValueChanged<String>? onChanged;
  final String? value;
  final String? errorText;

  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.hintText,
    this.isPassword = false,
    this.suffixText,
    this.maxLength,
    this.enabled = true,
    this.suffix,
    this.onChanged,
    this.value = '',
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        obscureText: isPassword! ? true : false,
        maxLength: maxLength,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          suffix: suffix,
          suffixText: suffixText,
          labelText: hintText,
          hintText: hintText,
          enabled: enabled!,
          counterText: '',
          errorText: errorText
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        initialValue: value,
      ),
    );
  }
}
