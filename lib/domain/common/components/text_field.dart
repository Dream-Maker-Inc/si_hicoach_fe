import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final String? suffixText;
  final Widget? suffix;
  final int? maxLength;
  final bool? enabled;
  final bool? isPassword;
  final FormFieldValidator? validator;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.hintText,
    this.isPassword = false,
    this.suffixText,
    this.maxLength,
    this.validator,
    this.enabled = true,
    this.controller,
    this.suffix,
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
            borderSide: BorderSide(
              color: colorScheme.primary,
            ),
          ),
          suffix: suffix,
          suffixText: suffixText,
          labelText: hintText,
          hintText: hintText,
          enabled: enabled!,
          counterText: '',
        ),
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
      ),
    );
  }
}
